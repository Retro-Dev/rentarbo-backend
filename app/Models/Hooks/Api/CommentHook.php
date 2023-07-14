<?php

namespace App\Models\Hooks\Api;
use App\Models\Booking;
use App\Models\Product;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Notification;


class CommentHook
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
        $query->select('comments.*');
        $query->with('user','product');
        if(!empty($request->all_reviews)){
           $query->join('products','products.id','comments.product_id')
           ->where('products.user_id','=',$request['user']->id);
           
        }
        if(!empty($request->product_id)){
            $query->where('comments.product_id','=',$request->product_id);
            
         }
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
            $booking=Booking::getById($request->booking_id);
            $postdata['user_id']=$request['user']->id;
            $postdata['created_at']=Carbon::now();
            $postdata['product_id']=$booking->product_id;
            $postdata['slug']=rand(10000,99999).'comment'.time();




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
         $booking=Booking::getById($request->booking_id); 

         $data=$this->_model::getAverageComments($record->product_id);
         $product_update=[
            'rating'=>$data['rating_average'],
            'reviews'=>$data['total_reviews']
         ];
         Product::updateProduct($product_update,$record->product_id);
         $target=User::getUsersByIds([$booking->product_owner_id],'all');
         $notification_data=[
            'module'=>'comments',
            'module_id'=>$record->id,
            'reference_id'=>$record->booking_id,
            'reference_module'=>'bookings',
            'title'=>'New Rating',
            'message'=>"You have a new review, please tap to view details.",
            'actor'=>$request['user'],
            'target'=>$target,
           'redirect_link'=> $record->slug,

         ];
         if(count($target)>0){
         Notification::sendPushNotification('comments',$notification_data,['type'=>'comments','product_id'=>$record->product_id]);
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
        return 'CommentHook' . md5(implode('',$cache_params));
    }
}
