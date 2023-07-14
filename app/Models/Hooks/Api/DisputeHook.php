<?php

namespace App\Models\Hooks\Api;
use Carbon\Carbon;
use App\Models\Media;
use App\Models\Notification;
use App\Models\ProductSell;
use App\Models\Booking;
use App\Models\User;



class DisputeHook
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
        $query->with('images','user');
        if(empty($slug)){
        $query->where([['user_id','=',$request['user']->id],['module','=',$request->type]]);
        }
        
        if(!empty($slug)){
            $query->where('slug',$slug);
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
        $postdata['slug']=uniqid();
        $postdata['user_id']=$request['user']->id;
        $postdata['created_at']=Carbon::now();
        if ($request->module=='bookings') {
            $prod=Booking::findOrFail($request->module_id);
           }else{
            $prod=ProductSell::findOrFail($request->module_id);
           }
           $request->merge([
            'product_owner_id'=>$prod->product_owner_id,
           ]);
           $postdata['product_owner_id']=$prod->product_owner_id;

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
        if ($request->hasFile('images')) {
            $images =uploadMedia('disputes',$request['images']);
            if (count($images)) {
                $medias=array();
                foreach ($images as $key => $image) {
                   $medias[]=[
                       'module'=>'disputes', 
                       'module_id'=>$record->id,
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
       $admin=\DB::table('users')
       ->select('user_groups.*','users.*')
       ->join('user_groups','users.user_group_id','=','user_groups.id')
       ->where('user_groups.title','Admin')
       ->where('user_groups.is_super_admin','0')
       ->first();
       
       $notification_data=[
           'unique_id'=>uniqid().time(),
           'identifier'=>'disputes',
           'actor_id'=>$request['user']->id,
           'target_id'=>$admin->id,
           'module'=>$record->module,
           'module_id'=>$record->id,
           'reference_id'=>$record->id,
           'reference_module'=>'disputes',
           'title'=>'New Dispute Request',
           'web_redirect_link'=> $record->slug,
           'created_at'=>Carbon::now(),
           'description'=>"You have new dispute request to resolve.",
      ];    
      Notification::insert($notification_data);
      $prod=Booking::findOrFail($request->module_id);
      if ($prod->user_id==$request['user']->id) {
       $target_id=$prod->product_owner_id;
      }else{
       $target_id=$prod->user_id;
      }
      $target=User::getUsersByIds([$target_id],'all');
      $actor=User::getUserById($request['user']->id);
       $notification_data=[
           'module'=>'disputes',
           'module_id'=>$record->id,
           'reference_id'=>$record->module_id,
           'reference_module'=>$record->module,
           'title'=>'Dispute Request',
           'message'=>$actor->name." has reported a dispute against booking $record->module_id, please tap to view details.",
           'actor'=>$actor,
           'target'=>$target,
           'redirect_link'=> $record->slug,

          ];
          if(count($target)>0){
       Notification::sendPushNotification('disputes',$notification_data,['type' => 'disputes','owner_id'=>$request->product_owner_id,'slug'=>$record->slug,'product_type'=>$record->module]);

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
        // return 'DisputeHook' . md5(implode('',$cache_params));
        return 'DisputeHook' . md5(json_encode($cache_params));

    }
}
