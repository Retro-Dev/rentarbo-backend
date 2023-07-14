<?php

namespace App\Http\Controllers\Api;
use Carbon\Carbon;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\ChatRoom;
use App\Models\ChatRoomUser;

class ChatRoomUserController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('ChatRoomUser');
        $this->__request     = $request;
        $this->__apiResource = 'ChatRoomUser';
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
                    'user_id'        => 'required|exists:users,id,deleted_at,NULL',
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

    public function create_chat(){
        $request = $this->__request;
        $param_rule['user_id'] = 'required|exists:users,id,deleted_at,NULL';
        $param_rule['other_id'] = 'required|exists:users,id,deleted_at,NULL';


        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;
            $chek_validation=ChatRoom::check_chat_room(['user_id'=>$request->user_id,'current_id'=>$request->other_id]);
            if(!empty($chek_validation) && (count($chek_validation)>=1)){
                $data['room_id']=$chek_validation[0]->chat_id;
            }else{
            $chat_room_data=[
                'created_by'=>$request['user']->id,
                'slug'=>uniqid().time(),
                'identifier'=>time(),
                'title'=>"Booking",
                'image_url'=>"ff",
                'description'=>"ff",
                'created_at'=>Carbon::now()
                ];
           
            $chat_room=ChatRoom::insertData($chat_room_data);
            $data['room_id']=$chat_room->id;
            $chat_users=[[
                'chat_room_id'=>$chat_room->id,
                'user_id'=>$request['user']->id,
                'last_chat_message_id'=>0,
                'last_message_timestamp'=>Carbon::now(),
                'is_owner'=>1,
                'created_at'=>Carbon::now()],
                [
                'chat_room_id'=>$chat_room->id,
                'user_id'=>$request->user_id,
                'last_chat_message_id'=>0,
                'is_owner'=>0,
                'last_message_timestamp'=>Carbon::now(),
                'created_at'=>Carbon::now()
                ]
            ];
            $chat_room=ChatRoomUser::insertData($chat_users);
        }
           
        $this->__collection  = false;
        $this->__is_paginate = false;
        return  $this->__sendResponse($data,200,'Chat initiated');

    }
}
