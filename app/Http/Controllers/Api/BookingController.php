<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Booking;
use App\Models\User;
use App\Models\UserCard;
use App\Models\UserTransaction;
use App\Models\UserConnectAccount;
use App\Libraries\Payment\Payment;

class BookingController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Booking');
        $this->__request     = $request;
        $this->__apiResource = 'Booking';
        $this->_gateway       = Payment::init();

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
            'driving_license.*.max' => __('app.image_upload'),
        ];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'product_id'         => 'required|exists:products,id,deleted_at,NULL',
                    'phone_no'           => 'required',
                    'rentar_name'        => 'required|min:3',
                    'details'            => 'required|min:20',
                    // 'duration'           => 'required|numeric|min:1|max:24',
                    // 'total_charges'      => 'required',
                    'from_time'          => 'required',
                    'to_time'            => 'required',
                    'booking_date'       => 'date',
                    'demo_hosting'       => 'required|in:yes,no',
                    'driving_license'    => 'required|array',
                    'driving_license.*'  => 'mimes:jpeg,jpg,png,gif,pdf|max:5000'
                ],$custom_messages);
                break;
            case 'PUT':
                $custom_messages = [
                    'images.*.max' => __('app.image_upload'),
                ];
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug'            =>"required|exists:bookings,slug,deleted_at,NULL",
                    'type'            => 'required|in:status,return,return_confirmed',
                    'return_confirmed'=> 'required_if:type,==,return_confirmed|in:0,1',
                    'images'          => 'required_if:type,==,return|array',
                    'images.*'        => 'mimes:jpeg,jpg,png,gif|max:5000',
                    'booking_status'     =>'required_if:type,==,status|in:cancell,complete,reject,accept,rented',
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
        $param_rules['type'] = 'nullable|in:cancelled,inprogress,completed,pending,rejected';
        $param_rules['product'] = 'nullable|exists:products,id,deleted_at,NULL';
        $param_rules['booking_type'] = 'required|in:sent,recieved';
        $param_rules['booking_id'] = 'exists:bookings,id,deleted_at,NULL';
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
        $cards=UserCard::countRecord($request['user']->id);
        if($cards<1){
            $this->__is_error = true;
            return $this->__sendError('Gateway Error',['message' => 'Please add card details'],400);
        } 
        if(!empty($request->booking_date)){
            $param_rules['from_time'] = 'date_format:H:i';
            $param_rules['to_time'] = 'date_format:H:i|after:from_time';
            $custom_messages=['to_time.after'=>'Start time must be earlier than end time'];
        }if(empty($request->booking_date)){
            $param_rules['from_time'] = 'date|after_or_equal:'.Date('Y-m-d');
            $param_rules['to_time'] = 'date|after_or_equal:from_time';
            $custom_messages=['to_time.after_or_equal'=>'Start date must be earlier than end date'];
        }
        $response = $this->__validateRequestParams($request->all(),$param_rules,$custom_messages);

        if( $this->__is_error )
            return $response;

        if(empty($request->booking_date)){

 
            $request = $this->__request;
            $checkInDate=$request->from_time;
            $checkOutDate=$request->to_time;
            $postID=$request->product_id;
            $bookings=Booking::checkBookingValidation($checkInDate,$checkOutDate,$postID);
            
            if(count($bookings)>0){
                $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' => 'Please select different date or time'], 400);
                }
        }
        // $booking=Booking::checkProductAvailablity($request->product_id);
        // if(!empty($booking)){
        //     $this->__is_error = true;
        //         return $this->__sendError(__('app.validation_msg'),['message' =>"Item is not available for booking"], 400);
        // }
    }
    

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {
         $check=User::with('connect_account')->find($request['user']->id);
           
            if ($check->connect_account==null) {
             $this->__is_error = true;
             return $this->__sendError(__('app.validation_msg'),['message' => 'Please add bank account detail or wait for bank account to be verified'], 400);
            }
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
        $booking=Booking::getBySlug($slug);
        if($request->type=='status'  && $request->booking_status=='cancell' && $request['user']->id!=$booking->user_id){
               $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>'You dont have permission to cancell'], 400);
        }if($request->type=='status'  && $request->booking_status=='cancell' && $request['user']->id==$booking->user_id && $booking->booking_status=='inprogress'){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You can't cancell "], 400);
        }if($request->type=='status'  && ($request->booking_status=='reject' || $request->booking_status=='accept') && $request['user']->id==$booking->user_id ){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You dont have permission to $request->booking_status "], 400);
        }if($request->type=='status'  && ($request->booking_status=='reject' || $request->booking_status=='accept') && $request['user']->id==$booking->product->user_id && $booking->booking_status!='pending' ){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"Sorry request not available "], 400);
        }
        if($request->type=='return'   && $request['user']->id!=$booking->user_id ){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You dont have permission to returned"], 400);
        }
        if($request->type=='return'   && $request['user']->id==$booking->user_id && $booking->booking_status!='inprogress' ){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You dont have permission to returned"], 400);
        }
        if($request->type=='return_confirmed'   && ($request['user']->id!=$booking->product->user_id || $booking->returned==0) ){
            $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You dont have permission to confirm returned "], 400);
        }
        if($request->type=='status' && $request->booking_status=='accept'){
            $amount=$booking->total_charges;
            $description=$booking->details;
            $currency="usd";
            $customer=User::getUserById($booking->user_id);
            $owner=User::getUserById($booking->product_owner_id);
            $bank_account=UserConnectAccount::getConnectAccount($request['user']->id);
            if($bank_account ==null || $bank_account->status!='verified'){
                $this->__is_error = true;
                return $this->__sendError('Gateway Error',['message' => 'Please add bank account detail'],400);
            } 
            $payment=$this->_gateway->customerCharge($customer->gateway_customer_id,$amount,$currency,$description);
            if($payment['code'] != 200 ){
                $this->__is_error = true;
                return $this->__sendError('Gateway Error',['message' => $payment['message']],400);
            } 
            else{
                $transfer_data=[
                    'amount'=>$booking->net_amount,
                    'destination'=>$owner->gateway_connect_id,
                    'charge_id'=>$payment['data']['transaction_id']
                ];
                $transfer=$this->_gateway->transfer( $transfer_data);
                $transaction_data=[
                    'sender_id'=>$customer->id,
                    'receiver_id'=>$owner->id,
                    'module'=>'booking',
                    'module_id'=>$booking->id,
                    'total_charges'=>$booking->total_charges,
                    'admin_tax'=>$booking->admin_tax,
                    'net_amount'=>$booking->net_amount,
                    'stripe_fee'=>$booking->stripe_fee,
                    'gateway_transaction_id'=>$payment['data']['transaction_id'],
                    'gateway_response'=> json_encode($payment)
                ];
                $transaction=UserTransaction::create($transaction_data);
            }
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
        $booking=Booking::getBySlug($slug);
        if(!empty($booking) && ($booking->return_confirmed!=null   || $request['user']->id!=$booking->product_owner_id )){
           $this->__is_error = true;
           return $this->__sendError(__('app.validation_msg'),['message' =>"You can't delete booking"], 400);
        }if(empty($booking)){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"Booking not found"], 400);
        }
        

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function check_availability(){
        $request = $this->__request;
        $param_rules['filter_date'] = 'nullable|date';
        $param_rules['product_id'] = 'required|exists:products,id,deleted_at,NULL';

        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;
        $booking=Booking::check_booking_availability($request->filter_date,$request->product_id);
        $this->__collection  = false;
        $this->__is_paginate = false;
        return $this->__sendResponse($booking,200,__('app.success_listing_message'));


    }
   
}
