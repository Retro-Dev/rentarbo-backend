<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Notification;
use App\Models\User;


class NotificationController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('Notification');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Notification';
        $this->__indexView  = 'notification.index';
        $this->__createView = 'notification.add';
        $this->__editView   = 'notification.edit';
        $this->__detailView = 'notification.detail';
    }

    /**
     * This function is used for validate data
     * @param string $action
     * @param string $slug
     * @return array|\Illuminate\Contracts\Validation\Validator
     */
    public function validation(string $action, string $slug=NULL)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'title' => 'required|min:3|max:191',
                    'description' => 'required|min:3|max:191',

                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    '_method'   => 'required|in:PUT',
                    'attribute' => 'required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * This function is used for before the index view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderIndexView()
    {

    }

    /**
     * This function is used to add data in datatable
     * @param object $record
     * @return array
     */
    public function dataTableRecords($record)
    {
        
        return [
            '<input type="checkbox" name="record_id[]" class="record_id" value="'. $record->slug .'">',
            $record->title,
            $record->description,
            date(config("constants.ADMIN_DATE_FORMAT") , strtotime($record->created_at)),
        ];
    }

    /**
     * This function is used for before the create view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderCreateView()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeStoreLoadModel()
    {

    }

    /**
     * This function is used for before the edit view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     * @param string @slug
     */
    public function beforeRenderEditView($slug)
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeUpdateLoadModel()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeRenderDetailView()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeDeleteLoadModel()
    {

    }

    

    public function sendPush(Request $request){
       
        $validator = Validator::make($request->all(), [
            'title' => 'required|min:3|max:191',
            'description' => 'required|min:3|max:1000',
               
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $all_users=User::where('user_type','=','user')->get()->pluck('id');
        foreach($all_users as $user){
             $target=User::getUsersByIds([$user],'all');
             $bage=Notification::getBadge($user);
             $notification_data=[
                'module'=>'admin',
                'module_id'=>12,
                'reference_id'=>null,
                'reference_module'=>null,
                'title'=>$request->title,
                'message'=>$request->description,
                'actor'=>\Auth::user(),
                'target'=>$target,
                'badge'=>$bage+1
             ];
             if(count($target)>0){
                Notification::sendPushNotification('identifire',$notification_data,null);
           }
         }
        return redirect()->back()->with('success',$this->__success_store_message);
    }
}
