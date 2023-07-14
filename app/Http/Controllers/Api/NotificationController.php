<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\NotificationSetting;
use App\Models\User;
use App\Models\ChatRoomUser;
use Illuminate\Http\Request;
use URL;
use Illuminate\Support\Facades\Storage;
class NotificationController extends Controller
{

    public function __construct()
    {
        $this->__apiResource = 'Notification';
    }

    public function index(Request $request)
    {
        $records = Notification::getUserNotifications($request->all());
        return $this->__sendResponse($records,200,__('app.success_listing_message'));
    }

    public function update(Request $request,$unique_id)
    {
        $record = Notification::updateNotification($request->all(),$unique_id);

        $this->__is_collection = false;
        $this->__is_paginate   = false;
        return $this->__sendResponse($record,200,__('app.success_update_message'));
    }

    public function sendNotification(Request $request)
    {
        $params = $request->all();

        $param_rule['target_id'] = 'required|exists:users,id';

        $response = $this->__validateRequestParams($params,$param_rule);
        if( $this->__is_error )
            return $response;

        $targetUsers = User::getUserApiTokenByID($params['target_id']);
        $userBadge   = Notification::getBadge($params['target_id']);

        if( count($targetUsers) ){
            //send push notification to research center
            $notification_data = [
                'actor'            => $params['user'],
                'target'           => $targetUsers,
                'title'            => env('APP_NAME'),
                'message'          => __('app.test_notification_msg'),
                'module'           => 'identifier',
                'module_id'        => 0,
                'reference_id'     => 0,
                'reference_module' => 'identifier',
                'redirect_link'    => NULL,
                'badge'            => $userBadge
            ];
            $custom_data = [
                'record_id'     => 0,
                'redirect_link' => NULL,
                'identifier'    => 'identifier',
            ];
            Notification::sendPushNotification('identifier',$notification_data,$custom_data,$targetUsers[0]->device_type);
        }

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse([],200,__('app.success_listing_message'));
    }

    public function saveNotificationSetting(Request $request)
    {
        $param_rule['notification_setting']   = 'required';
        $param_rule['notification_setting.*'] = 'required|in:1,0';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $records = NotificationSetting::saveSetting($request->all());

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse($records, 200, __('app.success_store_message'));
    }

    public function getNotificationSetting(Request $request)
    {
        $records = NotificationSetting::getSetting($request['user']->id);

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse($records, 200, __('app.success_listing_message'));
    }
    public function badgeCount(Request $request)
    {
        $records = Notification::getBadge($request['user']->id);

        $this->__is_paginate = false;
        $this->__collection  = false;
        $count=array();
        if($records>=1){
            $count[]=array('unread'=>$records);
        }
        return $this->__sendResponse($count, 200, __('app.success_listing_message'));
    }

    public function sendChatNotification(Request $request)
    {
        $actor       = User::where('id',$request['actor_id'])->first();
        if( $actor->user_group_id == 2 ){
            $actor = User::where('email',$actor->email)->first();
        }
        $targetUsers =User::getUsersByIds([$request['target_id']],'all');
        $offline=ChatRoomUser::where([['user_id','=',$request['target_id']],['chat_room_id','=',$request['chat_room_id']],['status','=',0]])
        ->get();
      
        if( count($targetUsers) &&   count($offline)){
          
            if( $targetUsers[0]->user_group_id == 2 ){
                $targetUsers = User::where('email',$targetUsers[0]->email)->get();
            }
            //send push notification to research center
            if( $targetUsers[0]->user_type == 'host' ){
               $redirect_link = \URL::to('/host/inbox');
            } else {
               $redirect_link = \URL::to('/pastor/inbox');
            }
            $notification_data=[
                'module'=>'chat',
                'module_id'=>$request['chat_message_id'],
                'reference_id'=>$request['chat_room_id'],
                'reference_module'=>'chat',
                'title'=>'Chat',
                'message'=>$request['chat_message'],
                'redirect_link'=>$redirect_link,
                'actor'=> $actor,
                'target'=>$targetUsers
               ];

               $custom_data=['type' => 'chat',
               'redirect_link'=>$redirect_link,
               'actor_name'=>$actor->name,
               'owner_id'=>$request['actor_id'],
               'product_id'=>"",
               'chat_room_id'=>$request['chat_room_id'],
               'target_id'=>$request['target_id'],
               'actor_image'    => !empty($actor->image_url) ? Storage::url($actor->image_url) : URL::to('images/user-placeholder.jpg')];
            Notification::sendPushNotification('chat',$notification_data,$custom_data,$targetUsers[0]->device_type);
        }

        $this->__is_paginate = false;
        $this->__collection = false;

        return $this->__sendResponse([],200,__('app.success_listing_message'));
    }
}
