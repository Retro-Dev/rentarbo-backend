<?php

namespace App\Models\Hooks\Api;
use App\Models\Product;
use App\Models\User;
use App\Models\Notification;
use App\Models\ChatRoom;
use App\Models\ChatRoomUser;
use Carbon\Carbon;
class ProductSellHook
{
    private $_model;

    public function __construct($model)
    {
        $this->_model = $model;
    }

    /* 
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug=NULL) {
        //Your code here
        $query->with(['rentar','owner','product'=>function($q){
            $q->with('media','category');
        }]);
        
        if($request->type=='recieved'){
            $query->where([['product_owner_id','=',$request['user']->id],['product_id','=',$request->product]]);
        }
        if($request->type=='sent'){
            $query->where('user_id','=',$request['user']->id);
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {
        $record=Product::getById($request->product_id);
        $postdata['product_id']=$record->id;
        $postdata['product_owner_id']=$record->user_id;
        $postdata['user_id']=$request['user']->id;
        $postdata['slug']=uniqid().time();
        $total_charges=$record->sell_price;
        $stripe_fee=$this->calculateGatewayFee($total_charges);
        $plat_form_fee=(14/100)*($total_charges-$stripe_fee);
        $postdata['stripe_fee']=$stripe_fee;
        $postdata['total_charges']=$total_charges;
        $postdata['admin_tax']=$plat_form_fee;
        $postdata['net_amount']=$total_charges-$plat_form_fee-$stripe_fee;
        

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
        //Your code here
        // $sell=$this->_model::getBySlug($record->sl);
       
        $actor=User::getUserById($record->user_id);
        $target=User::getUsersByIds([$record->product_owner_id],'all');
        
        $message="You have a new purchase request, please tap to view details.";
        $notification_data=[
            'module'=>'sell',
            'module_id'=>$record->id,
            'reference_id'=>$record->product_id,
            'reference_module'=>'products',
            'title'=>'Sell status',
            'redirect_link'=> $record->slug,
            'message'=>$message,
            'actor'=>$actor,
            'target'=>$target
       ];    
       
       if(count($target)>0){
     Notification::sendPushNotification('sell',$notification_data,['type' => 'sell','product_id'=>(string)$record->product_id,'owner_id'=>$record->product_owner_id,'slug'=>$record->slug]);
       }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {

        
        if($request['picked_up_status']==1){
            $postData['picked_up']=Carbon::now();
            $postData['sell_status']='completed';

        }
        if($request['delivered_status']==1){
            
            $postData['delivered_at']=Carbon::now();
        }

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
        $sell=$this->_model::getBySlug($slug);
        if($request->picked_up_status==1){
            $actor=User::getUserById($sell->user_id);
            $target=User::getUsersByIds([$sell->product_owner_id],'all');
            $message="Your item has been sold.";
            $data=['sell_status'=>1,'status'=>0];
            $record=Product::updateProduct($data,$sell->product_id);
         }if($request->delivered_status==1){
             $actor=User::getUserById($sell->product_owner_id);
             $target=User::getUsersByIds([$sell->user_id],'all');
            $message="Item has been delivered";

         }if($request->sell_status=='accepted' || $request->sell_status=='rejected'){
            $actor=User::getUserById($sell->product_owner_id);
            $target=User::getUsersByIds([$sell->user_id],'all');
            $message="Your purchase request has been $request->sell_status, please tap to view details.";
         }if($request->sell_status=='cancelled' ){
            $actor=User::getUserById($sell->user_id);
            $target=User::getUsersByIds([$sell->product_owner_id],'all');
            $message="Sell request has been".$request->sell_status;
         }
       
        

        $notification_data=[
            'module'=>'sell',
            'module_id'=>$sell->id,
            'reference_id'=>$sell->product_id,
            'reference_module'=>'products',
            'title'=>'Sell status',
            'redirect_link'=> $sell->slug,
            'message'=>$message,
            'actor'=>$actor,
            'target'=>$target
       ];    
       if($sell->sell_status=='accepted'){
        $chek_validation=ChatRoom::check_chat_room(['user_id'=>$sell->user_id,'current_id'=>$sell->product_owner_id]);
        if(empty($chek_validation) && count($chek_validation)<1){
            $this->create_chat($sell);
        }
       }
       if(count($target)>0){
     Notification::sendPushNotification('sell',$notification_data,['type' => 'sell','product_id'=>(string)$sell->product_id,'owner_id'=>$sell->product_owner_id,'slug'=>$sell->slug]);
       }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'ProductSellHook' . md5(implode('',$cache_params));
    }
    public function create_chat($record){
        $chat_room_data=[
            'created_by'=>$record->product_owner_id,
            'slug'=>uniqid().time(),
            'identifier'=>time(),
            'title'=>"Sell",
            'image_url'=>"ff",
            'description'=>"ff",
            'created_at'=>Carbon::now()
            ];
       
        $chat_room=ChatRoom::insertData($chat_room_data);
        $chat_users=[[
            'chat_room_id'=>$chat_room->id,
            'user_id'=>$record->product_owner_id,
            'last_chat_message_id'=>0,
            'last_message_timestamp'=>Carbon::now(),
            'is_owner'=>1,
            'created_at'=>Carbon::now()],
            [
            'chat_room_id'=>$chat_room->id,
            'user_id'=>$record->user_id,
            'last_chat_message_id'=>0,
            'is_owner'=>0,
            'last_message_timestamp'=>Carbon::now(),
            'created_at'=>Carbon::now()
            ]
        ];
        $chat_room=ChatRoomUser::insertData($chat_users);
    }

    public function calculateGatewayFee($amount)
    {
        $fee = ( ( ($amount * 2.9) / 100) + 0.3);
        return $fee;
    }
}
