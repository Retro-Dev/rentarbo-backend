<?php

namespace App\Models\Hooks\Api;
use App\Models\Media;
use Carbon\Carbon;
use App\Helpers\CustomHelper;
use App\Models\Product;
use App\Models\BookingStatus;
use App\Models\Notification;
use App\Models\User;
use App\Models\ChatRoom;
use App\Models\ChatRoomUser;



class BookingHook
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
        
        if(empty($slug) && $request->booking_type=='sent'){
            $query->where('user_id','=',$request['user']->id);
        }
        if(empty($slug) && $request->booking_type=='recieved'){
            $query->where('product_owner_id','=',$request['user']->id);
        }
        if(!empty($request->status_type)){
            $query->where('booking_status','=',$request->status_type);
        }
        if(!empty($request->returned_status)){
            $query->where([['returned','=',$request->returned_status]])
            ->with('return_conditions');
        }
        if(!empty($slug)){
            $query->where('slug','=',$slug)->with('license','comment');
        }
        if(!empty($request->product)){
            $query->where('product_id','=',$request->product);
            
        }
        if(!empty($request->booking_id)){
            $query->where('id','=',$request->booking_id);
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
            
            $product=Product::getById($request->product_id);  
            $postdata['user_id']=$request['user']->id;
            $postdata['product_owner_id']=$product->user_id;
            $postdata['slug']=time().rand(10000,99999);
            $postdata['created_at']=Carbon::now();
            $postdata['booking_date']=$request->booking_date??Carbon::now()->format('Y-m-d');
            if($product->rent_type=='hr'){
                $from = strtotime($request->from_time);
                $to = strtotime($request->to_time);
                $difference = round(abs($to - $from) / 3600,2);
                $total_time=ceil($difference);
            }else{
                $from = strtotime($request->from_time); // or your date as well
                $to = strtotime($request->to_time);
                $datediff = $to - $from;
                $difference= round($datediff / (60 * 60 * 24));
                $total_time=$difference+1;
            }
            $total_charges=$total_time*$product->rent_charges;;
            $stripe_fee=$this->calculateGatewayFee($total_charges);
            $plat_form_fee=(14/100)*($total_charges-$stripe_fee);
            $postdata['stripe_fee']=$stripe_fee;
            $postdata['duration']=$total_time;
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

         if ($request->hasFile('driving_license')) {
             $images =uploadMedia('bookings',$request['driving_license']);
             if (count($images)) {
                $medias=array();
                 foreach ($images as $key => $image) {
                    $medias[]=[
                        'module'=>'bookings', 
                        'module_id'=>$record->id,
                        'filename'=>$image, 
                        'original_name'=>$request['driving_license'][$key]->getClientOriginalName(),
                        'file_url'=>$image,   
                        'mime_type'=>$request['driving_license'][$key]->getClientMimeType(),
                        'file_type'=>$request['driving_license'][$key]->getClientOriginalExtension(),   
                        'created_at'=>Carbon::now()];
                 }     
                 $meda_upload=Media::media_upload($medias);

            }
        }
        $target=User::getUsersByIds([$record->product_owner_id],'all');
        $notification_data=[
            'module'=>'bookings',
            'module_id'=>$record->id,
            'reference_id'=>$record->product_id,
            'reference_module'=>'products',
            'title'=>'Booking',
            'redirect_link'=> $record->slug,
            'message'=>'You have a new rental request, please tap to view details.',
            'actor'=>User::getUserById($record->user_id),
            'target'=>$target
           ];
        if(count($target)>0){
            Notification::sendPushNotification('bookings',$notification_data,['type' => 'booking','product_id'=>(string)$record->product_id,'owner_id'=>$record->product_owner_id,'slug'=>$record->slug]);
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
        $status=array("cancell"=>"cancelled","complete"=>"completed","accept"=>"accepted","rented"=>"inprogress","reject"=>"rejected");
        $return_confirmed=array("0"=>NULL,"1"=>Carbon::now());
         if($request->type=='status'){
            $postData['booking_status']=$status[$request->input('booking_status')];
         }
         if($request->type=='return'){
            $postData['returned']=$request->return;
            $postData['returned_at']=Carbon::now();
         }   
         if($request->type=='return_confirmed'){
            if($return_confirmed[$request->return_confirmed]!=null){
                $postData['booking_status']='completed';
                $postData['return_confirmed']=$return_confirmed[$request->return_confirmed];
            }
            else{
                $postData['returned']='0';
                $postData['returned_at']=null;
            }
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

    $booking=$this->_model::getBySlug($slug);  
     if($request->hasFile('images')) {
        $images =uploadMedia('returned',$request['images']);
        if(count($images)){
            $medias=array();
                 foreach ($images as $key => $image) {
                    $medias[]=[
                        'module'=>'bookings', 
                        'module_id'=>$booking->id,
                        'filename'=>$image, 
                        'original_name'=>$request['images'][$key]->getClientOriginalName(),
                        'file_url'=>$image,   
                        'mime_type'=>$request['images'][$key]->getClientMimeType(),
                        'file_type'=>$request['images'][$key]->getClientOriginalExtension(),   
                        'created_at'=>Carbon::now()];
                 }     
            $meda_upload=Media::media_upload($medias);      
          }
      }
 
         $status=array("cancell"=>"cancelled","complete"=>"completed","accept"=>"accepted","rented"=>"inprogress","reject"=>"rejected");
         if($request->booking_status=='cancell' || $request->type=='return'){
            $actor=User::getUserById($booking->user_id);
            $target=User::getUsersByIds([$booking->product_owner_id],'all');
         }else{
             $actor=User::getUserById($booking->product_owner_id);
             $target=User::getUsersByIds([$booking->user_id],'all');
         }

         if($request->type=='status'){
            $booking_status_data=[
                'type'=>'status',
                'type_value'=>$status[$request->input('booking_status')],
                'user_id'=>$request['user']->id,
                'booking_id'=>$booking->id
            ];
            BookingStatus::createBookingStatus($booking_status_data);
            if($request->booking_status=='accept'){
                $message='Your rental request has been accepted successfully, please tap to view details.';
            }if($request->booking_status=='rented'){
                $message='You have successfully possessed the rented item.';
                $notification_data=[
                    'module'=>'bookings',
                    'module_id'=>$booking->id,
                    'reference_id'=>$booking->product_id,
                    'reference_module'=>'products',
                    'title'=>'Booking status',
                    'redirect_link'=> $booking->slug,
                    'message'=>$message,
                    'actor'=>$actor,
                    'target'=>$target
               ];
            }if($request->booking_status=='reject'){
                $message='Booking has been rejected successfully.';
                $notification_data=[
                    'module'=>'bookings',
                    'module_id'=>$booking->id,
                    'reference_id'=>$booking->product_id,
                    'reference_module'=>'products',
                    'title'=>'Booking status',
                    'redirect_link'=> $booking->slug,
                    'message'=>$message,
                    'actor'=>$actor,
                    'target'=>$target
               ];
            }
            if($request->booking_status=='cancell'){
                $message=$actor->name.' has cancelled the booking #'.$booking->id;
                Product::updateProduct(['status'=>1],$booking->product_id);
                $notification_data=[
                    'module'=>'bookings',
                    'module_id'=>$booking->id,
                    'reference_id'=>$booking->product_id,
                    'reference_module'=>'products',
                    'title'=>'Booking status',
                    'redirect_link'=> $booking->slug,
                    'message'=>$message,
                    'actor'=>$actor,
                    'target'=>$target
               ];
            }

           

           
           if($request->booking_status=='accept' || $request->booking_status=='rented'){
            Product::updateProduct(['status'=>0],$booking->product_id);
            $notification_data=[
                'module'=>'bookings',
                'module_id'=>$booking->id,
                'reference_id'=>$booking->product_id,
                'reference_module'=>'products',
                'title'=>'Booking status',
                'redirect_link'=> $booking->slug,
                'message'=>$message,
                'actor'=>$actor,
                'target'=>$target
           ];
            // $this->_model::update_booking($booking->product_id,$slug);
            $chek_validation=ChatRoom::check_chat_room(['user_id'=>$booking->user_id,'current_id'=>$booking->product_owner_id]);
            if(empty($chek_validation) && count($chek_validation)<1){
                $this->create_chat($booking);
            }
           
           }
         }

         if ($request->booking_status=='accept') {
            $admin=\DB::table('users')
                ->select('user_groups.*','users.*')
                ->join('user_groups','users.user_group_id','=','user_groups.id')
                ->where('user_groups.title','Admin')
                ->where('user_groups.is_super_admin','0')
                ->first();
                $notification_data=[
                    'unique_id'=>uniqid().time(),
                    'identifier'=>'contact',
                    'actor_id'=>$request['user']->id,
                    'target_id'=>$admin->id,
                    'module'=>'payment',
                    'module_id'=>$booking->id,
                    'reference_id'=>$booking->id,
                    'reference_module'=>'booking',
                    'title'=>'Payment Recieved',
                    'web_redirect_link'=> \URL::to('admin/user-transction'),
                    'created_at'=>Carbon::now(),
                    'description'=>"New Payment Recieved ",
            ];    
            Notification::insert($notification_data);
            $notification_data=[
                'module'=>'bookings',
                'module_id'=>$booking->id,
                'reference_id'=>$booking->product_id,
                'reference_module'=>'products',
                'title'=>'Booking status',
                'redirect_link'=> $booking->slug,
                'message'=>$message,
                'actor'=>$actor,
                'target'=>$target
           ];
         }

         if($request->type=='return'){
            $booking_status_data=['type'=>'return',
                'type_value'=>$request->return,
                'user_id'=>$request['user']->id,
                'booking_id'=>$booking->id
            ];
            BookingStatus::createBookingStatus($booking_status_data);
            $notification_data=['module'=>'bookings',
                'module_id'=>$booking->id,
                'reference_id'=>$booking->product_id,
                'reference_module'=>'products',
                'title'=>'Booking status',
                'redirect_link'=> $booking->slug,
                'message'=>'Your item has been returned successfully, please tap to view details.',
                'actor'=>$actor,
                'target'=>$target
           ];
         }   
         if($request->type=='return_confirmed'){
            $booking_status_data=[
                'type'=>'return_confirmed',
                'type_value'=>(string) $request->return_confirmed,
                'user_id'=>$request['user']->id,
                'booking_id'=>$booking->id
           ];
            BookingStatus::createBookingStatus($booking_status_data); 
            $notification_data=[
                'module'=>'bookings',
                'module_id'=>$booking->id,
                'reference_id'=>$booking->product_id,
                'reference_module'=>'products',
                'title'=>'Booking status',
                'redirect_link'=> $booking->slug,
                'message'=>"You have successfully returned the rented item. Please don't forget to leave your ratings & reviews.",
                'actor'=>$actor,
                'target'=>$target
           ];    
        //    if($request->return_confirmed){
        //     Product::updateProduct(['status'=>1],$booking->product_id);
        //    }       
         } 
         if(count($target)>0){

         Notification::sendPushNotification('bookings',$notification_data,['type' => 'booking','product_id'=>(string)$booking->product_id,'owner_id'=>$booking->product_owner_id,'slug'=>$booking->slug]);
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
        return 'BookingHook' . md5(json_encode($cache_params));
    }

    public function create_chat($record){
        $chat_room_data=[
            'created_by'=>$record->product_owner_id,
            // 'booking_id'=>$record->id,
            'slug'=>uniqid().time(),
            'identifier'=>time(),
            'title'=>"Booking",
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
