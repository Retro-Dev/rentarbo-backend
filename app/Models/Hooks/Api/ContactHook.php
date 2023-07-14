<?php

namespace App\Models\Hooks\Api;
use Carbon\Carbon;
 use App\Models\Notification;
class ContactHook
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
        $postdata['user_id']=$request['user']->id;
        $postdata['created_at']=Carbon::now();
        $postdata['slug']=rand(10000,99999).'contact'.time();
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
            'module'=>'contact',
            'module_id'=>$record->id,
            'reference_id'=>$record->id,
            'reference_module'=>'contact',
            'title'=>'New User Query Request',
            'web_redirect_link'=> $record->slug,
            'created_at'=>Carbon::now(),
            'description'=>"You have new query to respond him it.",
       ];    
       Notification::insert($notification_data);
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
        return 'ContactHook' . md5(implode('',$cache_params));
    }
}
