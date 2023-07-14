<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Product;
use App\Models\Media;
use App\Models\Booking;
use App\Models\ProductSell;



class ProductController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Product');
        $this->__request     = $request;
        $this->__apiResource = 'Product';
    }

    /**
     * This function is used for validate restfull request
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug=0)
    {
        $validator = [];
        $custom_messages = [
            'image_url.*.max' => __('app.image_upload'),
            'image_url.max' => __('app.image_upload_product'),

        ];
        switch ($action){ 
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    "name"                       =>"required|min:3|max:100",
                    "category_id"                =>"required|exists:categories,id,deleted_at,NULL",
                    "description"                =>"required|min:10|max:500",
                    "tags"                       =>"nullable|array",
                    "rent_type"                  =>"required|in:hr,day",
                    "rent_charges"               =>"required|regex:/^\d+(\.\d{1,2})?$/",
                    "pick_up_location_address"   =>"required|min:10",
                    "pickup_lat"                 =>"required",
                    "pickup_lng"                 =>"required",
                    "drop_location_address"      =>"required|min:10",
                    "drop_lat"                   =>"required",
                    "drop_lng"                   =>"required",
                    "ssn"                        =>"required",
                    "id_card"                    =>"required",
                    "driving_license"            =>"required",
                    "hosting_demos"              =>"required|in:1,0",
                    "image_url"                  =>"required|array|max:10",
                    "image_url.*"                =>"max:5000",



                ],$custom_messages);
                break;
    

            case 'PUT':
                $custom_messages = [
                    'image_url.*.max' => __('app.image_upload'),
                ];
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    "name"                       =>"required|min:3|max:100",
                    'slug'                       =>"required|exists:products,slug,deleted_at,NULL",
                    "category_id"                =>"required|exists:categories,id,deleted_at,NULL",
                    "description"                =>"required|min:10|max:500",
                    "tags"                       =>"nullable|array",
                    "rent_type"                  =>"required|in:hr,day",
                    "rent_charges"               =>"required|regex:/^\d+(\.\d{1,2})?$/",
                    "pick_up_location_address"   =>"required|min:10",
                    "pickup_lat"                 =>"required",
                    "pickup_lng"                 =>"required",
                    "drop_location_address"      =>"required|min:10",
                    "drop_lat"                   =>"required",
                    "drop_lng"                   =>"required",
                    "ssn"                        =>"required",
                    "id_card"                    =>"required",
                    "driving_license"            =>"required",
                    "hosting_demos"              =>"required|in:0,1",
                    "image_url"                  =>"nullable|array",
                    "image_url.*"                =>"max:5000",
                   


                ],$custom_messages);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {
        $request = $this->__request;
        $param_rules['type'] = 'required|in:map,owner';
        $param_rules['category'] = 'nullable|exists:categories,id,deleted_at,NULL';
        $param_rules['keyword'] = 'nullable|min:3';
        $param_rules['distance'] = 'nullable|numeric|min:1';
        $param_rules['rent_type'] = 'nullable|in:hr,day';
        $param_rules['latitude'] = 'nullable|numeric';
        $param_rules['longitude'] = 'nullable|numeric';
        $param_rules['product_id'] = 'exists:products,id,deleted_at,NULL';

        
        $response = $this->__validateRequestParams($request->all(),$param_rules);
        if( $this->__is_error )
            return $response;
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeUpdateLoadModel($request,$slug)
    {
        $record=Product::getProductBySlug($slug);
        $media=Media::getmedia($record->id,'products');
        if(!empty($request->image_url) && count($request->image_url)+count($media)>10 ){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"You can upload maximum 10 images"], 400);
        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterUpdateLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeDestroyLoadModel($request,$slug)
    {
        $product_data=Product::getProductBySlug($slug);
       $booking= Booking::checkBookingByProduct($product_data->id);
       if(!empty($booking)){
        $this->__is_error = true;
        return $this->__sendError(__('app.validation_msg'),['message' =>"Ad cannot be deleted when the booking is in progress. "], 400);
     }
    $sell= ProductSell::checkSellByProduct($product_data->id);
    if(!empty($sell)){
     $this->__is_error = true;
     return $this->__sendError(__('app.validation_msg'),['message' =>"Ad cannot be deleted when the booking is in progress. "], 400);
   }
    if(empty($product_data)){
        if(!empty($product_data) && $product_data->user_id!=$request['user']->id){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"You dont have permission to delete product "], 400);
        }if(empty($product_data)){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"Product not found"], 400);
        }
    }
    }
    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function repost(){
        $request = $this->__request;
        $param_rules['is_sell'] = 'nullable|in:1';
        $param_rules['sell_price'] = 'required_if:is_sell,=,1|numeric|min:1';
        $param_rules['is_repost'] = 'required|in:yes,no';
        $param_rules['product_id'] = 'required|exists:products,id,deleted_at,NULL';
        $param_rules['booking_id'] = 'required|exists:bookings,id,deleted_at,NULL';


        $response = $this->__validateRequestParams($request->all(),$param_rules);
        if( $this->__is_error )
            return $response;
        $data=['sell_price'=>$request->sell_price??0,'is_sell'=>$request->is_sell??0,'status'=>1];
        $records=Product::updateProduct($data,$request->product_id);
        $respost_data=['is_repost'=>'1'];
        $records=Booking::updateBooking($respost_data,$request->booking_id);


        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return  $this->__sendResponse([],200,'Item reposted successfully...!');

            
    }
}
