<?php

namespace App\Models\Hooks\Admin;
use App\Models\User;
use App\Models\Notification;
 
class ProductHook
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
        $query->with('category','owner','media');
        if( !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where(function($where) use ($keyword){
                $where->orWhere('products.name','like',"$keyword%");
            });
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

        if($request->is_approved==1){
           $record=$this->_model::getProductBySlug($slug);
           $target=User::getUsersByIds([$record->user_id],'all');
           $admin=\DB::table('users')
                ->select('user_groups.*','users.*')
                ->join('user_groups','users.user_group_id','=','user_groups.id')
                ->where('user_groups.title','Admin')
                ->where('user_groups.is_super_admin','0')
                ->first();
           $notification_data=[
               'module'=>'products',
               'module_id'=>$record->id,
               'reference_id'=>$record->id,
               'reference_module'=>'products',
               'title'=>'Ads Status',
               'redirect_link'=> $record->slug,
               'message'=>'Your ads are approved by admin now you can get rental requests',
               'actor'=>User::getUserById($admin->id),
               'target'=>$target
              ];
           if(count($target)>0){
               Notification::sendPushNotification('products',$notification_data,['type' => 'products','product_id'=>(string)$record->id,'owner_id'=>$record->user_id,'slug'=>$record->slug]);
           }
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
        return 'ProductHook' . md5(implode('',$cache_params));
    }
}
