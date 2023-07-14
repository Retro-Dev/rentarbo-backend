<?php

namespace App\Models\Hooks\Admin;
use App\Models\User;
use App\Models\Notification;

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
       
        $query->with('user','booking','sell');
        $query->with('images','user');

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
        if($request->dispute_status=='declined' || $request->dispute_status=='disputed'){
            $postData['admin_status']='resolved';
        }else{
            $postData['admin_status']='pending';
            $postData['declined_dispute_reason']='';

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
        $record=$this->_model::getBySlug($slug);
        $target=User::getUsersByIds([$record->product_owner_id],'all');
         $notification_data=[
           'module'=>'disputes',
           'module_id'=>$record->id,
           'reference_id'=>$record->module_id,
           'reference_module'=>$record->module,
           'title'=>'Dispute Status',
           'message'=>'Your dispute request status update by admin, please tap to view details.',
           'actor'=>User::getUserById($record->user_id),
           'target'=>$target,
           'redirect_link'=> $record->slug,

          ];
          if(count($target)>0){
          Notification::sendPushNotification('disputes',$notification_data,['type' => 'disputes','owner_id'=>$request->product_owner_id,'slug'=>$record->slug ,'product_type'=>$record->module]);
         }

        $target=User::getUsersByIds([$record->user_id],'all');
         $notification_data=[
           'module'=>'disputes',
           'module_id'=>$record->id,
           'reference_id'=>$record->module_id,
           'reference_module'=>$record->module,
           'title'=>'Dispute Status',
           'message'=>'Your dispute request status update by admin, please tap to view details.',
           'actor'=>User::getUserById($record->user_id),
           'target'=>$target,
           'redirect_link'=> $record->slug,

          ];
          if(count($target)>0){
          Notification::sendPushNotification('disputes',$notification_data,['type' => 'disputes','owner_id'=>$request->product_owner_id,'slug'=>$record->slug,'product_type'=>$record->module]);
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
        return 'DisputeHook' . md5(implode('',$cache_params));
    }
}
