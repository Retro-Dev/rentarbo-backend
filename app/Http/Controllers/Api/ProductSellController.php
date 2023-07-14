<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\ProductSell;
use App\Models\User;
use App\Models\UserTransaction;
use App\Libraries\Payment\Payment;
class ProductSellController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('ProductSell');
        $this->__request     = $request;
        $this->__apiResource = 'ProductSell';
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
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'product_id'        => 'required|exists:products,id,deleted_at,NULL',
                    'phone_number'      =>"required",
                    'name'              =>"required",
                    'hosting_demo'      =>"required|in:0,1",
                    'additional_info'   =>"nullable|min:10:max:1000"

                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'type'                 =>"required|in:deliver,status,pick_up",
                    'sell_status'          => 'required_if:type,=,status|in:accepted,rejected,cancelled',
                    'picked_up_status'     => 'required_if:type,=,pick_up|in:0,1',
                    'delivered_status'     => 'required_if:type,=,deliver|in:0,1'

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
        $param_rules['type'] = 'required|in:sent,recieved';
        $param_rules['product'] = 'required_if:type,=,recieved|exists:products,id,deleted_at,NULL';

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
        $record=ProductSell::getBySlug($slug);
        if($record->sell_status!='pending' &&  $request->sell_status=='cancelled'){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' =>"Request Can't be cancelled"], 400);
        }
        if($request->type=='deliver'  && $request->delivered_status==1 && $record->picked_up==0){
               $this->__is_error = true;
                return $this->__sendError(__('app.validation_msg'),['message' =>"You can't pickup untill deliverd"], 400);
        }
        if($request->type=='pick_up' && $request->picked_up_status==1){
            $amount= $record->total_charges;
            $description=$record->details;
            $currency="usd";
            $customer=User::getUserById($record->user_id);
            $owner=User::getUserById($record->product_owner_id);
            $payment=$this->_gateway->customerCharge($customer->gateway_customer_id,$amount,$currency,$description);
            if($payment['code'] != 200 ){
                $this->__is_error = true;
                return $this->__sendError('Gateway Error',['message' => $payment['message']],400);
            } 
            else{
                $transfer_data=[
                    'amount'=>$record->net_amount,
                    'destination'=>$owner->gateway_connect_id,
                    'charge_id'=>$payment['data']['transaction_id']
                ];
                $transfer=$this->_gateway->transfer( $transfer_data);
                $transaction_data=[
                    'sender_id'=>$customer->id,
                    'receiver_id'=>$owner->id,
                    'module'=>'sell',
                    'module_id'=>$record->id,
                    'total_charges'=>$record->total_charges,
                    'admin_tax'=>$record->admin_tax,
                    'net_amount'=>$record->net_amount,
                    'stripe_fee'=>$record->stripe_fee,
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

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }
    
}
