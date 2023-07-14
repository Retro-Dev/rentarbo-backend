<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\ContentManagement; 
use App\Models\Media; 
use App\Http\Resources\MediaResource;
use Carbon\Carbon;

class FaqController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Faq');
        $this->__request      = $request;
        $this->__apiResource  = 'Faq';
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
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'attribute'        => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'attribute'     => 'required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {

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
    public function beforeUpdateLoadModel($request, $slug)
    {

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

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function content(Request $request){
        $request = $this->__request;
        $param_rules['slug'] = 'required|in:terms-condition,privacy-policy,about-us';
        $response = $this->__validateRequestParams($request->all(),$param_rules);
        if( $this->__is_error )
                return $response;
        $this->__collection  = false;
        $this->__is_paginate = false;
        $content=ContentManagement::getBySlug($request->slug);
        return $this->__sendResponse($content,200,__('app.success_listing_message'));

    }


    public function remove_media(Request $request){
        $request = $this->__request;
        $param_rules['media_id'] = 'required|exists:media,id,deleted_at,NULL';
        $param_rules['module'] = 'required';
        $param_rules['module_id'] = 'required';



        $response = $this->__validateRequestParams($request->all(),$param_rules);
        if( $this->__is_error )
                return $response;
        $this->__collection  = false;
        $this->__is_paginate = false;
        $content=Media::remove_single_media($request->media_id,$request->module);
        $medias=Media::getmedia($request->module_id,$request->module);
        return $this->__sendResponse(MediaResource::collection($medias),200,'Media removed succfully');

    }

    public function upload_media(){
        $request = $this->__request;
        $media=Media::getmedia($request->module_id,$request->module);
        if(!empty($request->image_url) && count($request->image_url)+count($media)>10 ){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"You can upload maximum 10 images"], 400);
        }
        $param_rules['image_url'] = 'required|array|max:10';
        $param_rules['image_url.*'] = 'max:5000';
        $param_rules['module'] = 'required';
        $param_rules['module_id'] = 'required';
        $custom_messages = [
            'image_url.*.max' => __('app.image_upload'),
            'image_url.max' => __('app.image_upload_product'),

        ];
        $response = $this->__validateRequestParams($request->all(),$param_rules,$custom_messages);
        if( $this->__is_error )
                return $response;
        if($request->hasFile('image_url')) {
            $images =uploadMedia($request->module,$request['image_url']);
            if(count($images)){
                foreach ($images as $key => $image) {
                    $file_type='image';
                    $thumbail='';
                    if(str_contains($request['image_url'][$key]->getClientMimeType(),'video')){
                        $file_type='video';
                        $thumbail=generateVideoThumb($request['image_url'][$key]->getPathName(), \Storage::path('thumbnail/'.uniqid().time().".jpg"));
                        $thumbail=substr( $thumbail, strpos( $thumbail,"public/") + 6);


                    }
                    $data=[
                        'module'=>$request->module, 
                        'module_id'=>$request->module_id, 
                        'filename'=>$image, 
                        'original_name'=>$request['image_url'][$key]->getClientOriginalName(), 
                        'file_url'=>$image,   
                        'mime_type'=>$request['image_url'][$key]->getClientMimeType(),
                        'file_type'=>$file_type,
                        'thumbnail_url'=> $thumbail,
                        'created_at'=>Carbon::now()
                    ];
                    $meda_upload=Media::media_upload($data);
                }       
            }
        }

        $medias=Media::getmedia($request->module_id,$request->module);
        $this->__collection  = false;
        $this->__is_paginate = false;
        return $this->__sendResponse(MediaResource::collection($medias),200,__('app.success_listing_message'));

    }
}
