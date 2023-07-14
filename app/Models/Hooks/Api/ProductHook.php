<?php

namespace App\Models\Hooks\Api;
use App\Models\Media;
use Carbon\Carbon;
use App\Helpers\CustomHelper;
use App\Models\CategoryUser;
use App\Models\Notification;
use App\Models\User;


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

        if(!empty($request->latitude) && !empty($request->longitude)  && !empty($request->type) &&  ($request->type=='map') ){
            $latitude=$request->latitude;
            $longitude=$request->longitude;
            $distance=$request->distance??10;
            $query->selectRaw('SQRT(POW(69.1 * (products.pickup_lat - '.$latitude.'), 2) + POW(69.1 * ('.$longitude.'-products.pickup_lng) * COS(products.pickup_lat / 57.3), 2)) AS distance')
            ->havingRaw("distance < $distance");
        }
        if(!empty($request->category) && !empty($request->type) &&  ($request->type=='map')){ 
            $query->where('category_id','=',$request->category);
        }
        if(empty($request->category) && !empty($request->type) &&  ($request->type=='map')){ 
            $userCategories=CategoryUser::getUserCategories($request['user']->id);
            $query->whereIn('category_id',$userCategories);
        }
        if(!empty($request->keyword) && !empty($request->type) &&  ($request->type=='map')){
            $query->where('name','like','%'.$request->keyword.'%');
        }
        if(!empty($request->rent_type) && !empty($request->type) &&  ($request->type=='map')){
            $query->where('rent_type','=',$request->rent_type);
        }
        if(!empty($request->type) &&  $request->type=='map'){
            $query->where([['status','=',1],['is_approved','=','1'],['user_id','<>',$request['user']->id],['sell_status','=',0]]);
        }
        if(($request->type=='owner')){
            $query->where('user_id','=',$request['user']->id);  
        }
        if(!empty($request->product_id)){
            $query->where('id','=',$request->product_id)->where('status','=',1)->orWhere('status','=',0);  
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
            $postdata['user_id']=$request['user']->id;
            $postdata['slug']=$request['name'].rand(10000,99999);
            $postdata['created_at']=Carbon::now();
            $postdata['tags']=json_encode($request->tags);


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
        if($request->hasFile('image_url')) {
            $images =uploadMedia('products',$request['image_url']);
            if(count($images)){
                foreach ($images as $key => $image) {
                    $file_type='image';
                    $thumbail='';
                    if(str_contains($request['image_url'][$key]->getClientMimeType(),'video')){
                        $file_type='video';
                        // $thumbail=generateVideoThumb($request['image_url'][$key]->getPathName(),public_path(uniqid().time().".jpg"));
                        $thumbail=generateVideoThumb($request['image_url'][$key]->getPathName(), \Storage::path('thumbnail/'.uniqid().time().".jpg"));
                        $thumbail=substr( $thumbail, strpos( $thumbail,"public/") + 6);


                    }
                    $data=[
                        'module'=>'products', 
                        'module_id'=>$record->id, 
                        'filename'=>$image, 
                        'original_name'=>$request['image_url'][$key]->getClientOriginalName(), 
                        'file_url'=>$image,   
                        'mime_type'=>$request['image_url'][$key]->getClientMimeType(),
                        // 'file_type'=>$request['image_url'][$key]->getClientOriginalExtension(),  
                        'file_type'=>$file_type,
                        'thumbnail_url'=> $thumbail,
                        'created_at'=>Carbon::now()
                    ];
                    $meda_upload=Media::media_upload($data);
                }       
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
            'identifier'=>'products',
            'actor_id'=>$request['user']->id,
            'target_id'=>$admin->id,
            'module'=>'products',
            'module_id'=>$record->id,
            'reference_id'=>$record->id,
            'reference_module'=>'products',
            'title'=>'New Product Request',
            'web_redirect_link'=> $record->slug,
            'created_at'=>Carbon::now(),
            'description'=>"You have new ads request to approve.",
       ];    
       Notification::insert($notification_data);

    //  Notification::sendPushNotification('products',$notification_data,['type' => 'products','product_id'=>(string)$record->id,'owner_id'=>$record->user_id,'slug'=>$record->slug]);

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
        if($request->is_repost=='yes'){
            $postData['status']=1;
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
        $record=$this->_model::getProductBySlug($slug);
        if($request->hasFile('image_url')) {
            $images =uploadMedia('products',$request['image_url']);
            if(count($images)){
                foreach ($images as $key => $image) {
                    $file_type='image';
                    $thumbail='';
                    if(str_contains($request['image_url'][$key]->getClientMimeType(),'video')){
                        $file_type='video';
                        $thumbail=generateVideoThumb($request['image_url'][$key]->getPathName(), \Storage::path(('thumbnail/'.uniqid().time().".jpg")));
                        $thumbail=substr( $thumbail, strpos( $thumbail, "public/") + 6);

                    }
                    $data=[
                        'module'=>'products', 
                        'module_id'=>$record->id, 
                        'filename'=>$image, 
                        'original_name'=>$request['image_url'][$key]->getClientOriginalName(), 
                        'file_url'=>$image,   
                        'mime_type'=>$request['image_url'][$key]->getClientMimeType(),
                        // 'file_type'=>$request['image_url'][$key]->getClientOriginalExtension(),  
                        'file_type'=>$file_type,
                        'thumbnail_url'=> $thumbail,
                        'created_at'=>Carbon::now()
                    ];
                    $meda_upload=Media::media_upload($data);
                }       
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
        return 'ProductHook' . md5(json_encode($cache_params));
    }
}
