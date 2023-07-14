<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\UserApiToken;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Models\NotificationSetting;
use App\Models\Notification;

class UserHook
{
    private $_model,
            $except_update_params = [
                'username',
                'slug',
                'email',
                // 'mobile_no',
                'password',
                'status',
                'is_email_verify',
                'is_mobile_verify',
                'mobile_otp',
                'email_otp',
                'remember_token',
            ];

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
        $query->select('users.*');
        //check same user
        if( $request['user']->slug == $slug ){
            $query->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                ->join('user_api_token AS uat','uat.user_id','=','users.id')
                ->where('uat.api_token',$request['api_token']);
                $query->with('connect_account','user_card');
        }
        $query->where('users.user_type','user');
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
        //delete un-verified account
        if( env('VERIFICATION_TYPE') != 'none'){
            if( env('VERIFICATION_TYPE') == 'email'){
                $this->_model::where('email',$postdata['email'])->forceDelete();
            }
            if( env('VERIFICATION_TYPE') == 'mobile'){
                $this->_model::where('mobile_no',$postdata['mobile_no'])->forceDelete();
            }
        }
        if( env('MAIL_SANDBOX') ){
            $postdata['is_email_verify'] = '1';
            $postdata['email_verify_at'] = Carbon::now();
        }
        //set data
        $postdata['user_group_id'] = 2;
        $postdata['user_group_id'] = 1;
        $postdata['username']   = $this->_model::generateUniqueUserName($postdata['first_name']." ".$postdata['last_name']);
        $postdata['slug']       = $this->_model::generateUniqueUserName($postdata['first_name']." ".$postdata['last_name']);
        $postdata['name']       = $postdata['first_name']." ".$postdata['last_name'];

        $postdata['password']   = Hash::make($postdata['password']);
        $postdata['created_at'] = Carbon::now();
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
        $api_token  = UserApiToken::generateApiToken($record->id,$request->ip(),$request->header('token'),$record->created_at);
        $request['api_token'] = $api_token;
        $request['user']      = $record;
        //insert api token
        \DB::table('user_api_token')
            ->insert([
                'user_id'       => $record->id,
                'api_token'     => $api_token,
                'refresh_token' => NULL,
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => !empty($request['platform_type']) ? $request['platform_type'] : 'custom',
                'platform_id'   => !empty($request['platform_id']) ? $request['platform_id'] : NULL,
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now()
            ]);
        //send verification email
        if( env('VERIFICATION_TYPE') == 'email' && env('MAIL_SANDBOX') == 0 ){
            $mail_params['USERNAME'] = $record->name;
            $mail_params['LINK']     = route('verifyEmail',['name' => encrypt($record->email)]);
            $mail_params['YEAR']     = date('Y');
            $mail_params['APP_NAME'] = env('APP_NAME');
            sendMail($record->email,'user_registration',$mail_params);
        }
        $notification_setting=[
            ['meta_key'=>'all','meta_value'=>1,'user_id'=>$record['id'],'created_at'=>Carbon::now()]

        ];
        $records = NotificationSetting::saveInitialSetting($notification_setting);
        $admin=\DB::table('users')
            ->select('user_groups.*','users.*')
            ->join('user_groups','users.user_group_id','=','user_groups.id')
            ->where('user_groups.title','Admin')
            ->where('user_groups.is_super_admin','0')
            ->first();
        $notification_data=[
            'unique_id'=>uniqid().time(),
            'identifier'=>'users',
            'actor_id'=>$request['user']->id,
            'target_id'=>$admin->id,
            'module'=>'users',
            'module_id'=>$record->id,
            'reference_id'=>$record->id,
            'reference_module'=>'users',
            'title'=>'New User Registraion Request',
            'web_redirect_link'=> $record->slug,
            'created_at'=>Carbon::now(),
            'description'=>"You have new registration request to approve.",
       ];    
       Notification::insert($notification_data);
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
        $postData['name']=$postData['first_name']." ".$postData['last_name'];
        foreach( $postData as $key => $value ){
            if( in_array($key,$this->except_update_params) )
                unset($postData[$key]);
        }
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('users',$postData['image_url']);
            $blur_image = CustomHelper::getBlurHashImage(Storage::path($postData['image_url']));
            $postData['blur_image'] = $blur_image;
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
        $cache_params = $request->isMethod('post') ? [] : $request->except(['user','api_token']);
        return 'users_api_' . md5(implode('',$cache_params));
    }
}
