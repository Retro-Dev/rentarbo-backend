<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\CategoryUser;
use Carbon\Carbon;
class CategoryController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Category');
        $this->__request     = $request;
        $this->__apiResource = 'Category';
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
                    // 'attribute'        => 'required',
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
    public function beforeUpdateLoadModel($request,$slug)
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
    public function createUserCatetgory(){
        $request = $this->__request;
        $param_rules['category'] = 'required|array';
        $param_rules['category.*'] = 'required|exists:categories,id';
        $response = $this->__validateRequestParams($request->all(),$param_rules);
        if( $this->__is_error )
            return $response;
            
        CategoryUser::deleteCategory($request['user']->id);
        $categories=$request->category;
        foreach ($categories as $key=> $category) {
            $postdata['user_id']=$request['user']->id;
            $postdata['created_at']=Carbon::now();
            $postdata['slug']=uniqid().time().rand(10000,99999);
            $postdata['category_id']=$category;
            CategoryUser::insertCategory($postdata);
        }
        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse([],200,('Categories updated successfully'));

    }

    
}
