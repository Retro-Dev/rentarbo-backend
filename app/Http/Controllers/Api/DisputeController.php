<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Booking;
use App\Models\Dispute;


class DisputeController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Dispute');
        $this->__request     = $request;
        $this->__apiResource = 'Dispute';
        $this->__success_store_message   = __('app.success_store_dispute');

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
                    'description'        => 'required|min:3|max:1000',
                    'module_id'          => 'required',
                    'module'             =>'required|in:bookings,sell',
                    'images'             =>'required|array',
                    'images.*'           => 'mimes:jpeg,jpg,png,gif,pdf|max:5000'

                ]);
                break;
            case 'PUT':
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug'      =>"required|exists:disputes,slug,deleted_at,NULL",
                    'description'        => 'required|min:3|max:1000',
                    'booking_id'         => 'required|exists:bookings,id,deleted_at,NULL',
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
        $request = $this->__request;
        $param_rules['type'] = 'required|in:sell,bookings';
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
        $record=Dispute::getDispute($request->module_id,$request->module);
        
        // $booking=Booking::getById($request->booking_id);
        if($record){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"Dispute already submited"], 400);
        }
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
}
