<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class DisputeController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('Dispute');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Dispute';
        $this->__indexView  = 'dispute.index';
        $this->__createView = 'dispute.add';
        $this->__editView   = 'dispute.edit';
        $this->__detailView = 'dispute.detail';
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
                    'attribute' => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    '_method'   => 'required|in:PUT',
                    'declined_dispute_reason' => 'nullable|min:10|max:1000',
                    'admin_status' => 'in:resolved,pending',
                    'dispute_status' => 'required|in:pending,progress,disputed,declined',

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
        $name=""; 
        if ($record->module=='bookings') {
          $name= ($record->booking->product) ? $record->booking->product->name : '';
        } if ($record->module=='sell') {
            $name= ($record->booking->product) ? $record->booking->product->name : '';
        }
        $options  = '<a href="'. route('dispute.edit',['dispute' => $record->slug]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a>';
        $options .= '<a title="Delete" class="btn btn-xs btn-danger _delete_record"><i class="fa fa-trash"></i></a>';
        return [
            // '<input type="checkbox" name="record_id[]" class="record_id" value="'. $record->slug .'">',
            $record->user->name,
            $record->module,
            $record->module_id,
           $name,
            $record->admin_status == 'pending' ? '<span class="btn btn-xs btn-danger">Pending</span>' : '<span class="btn btn-xs  btn-success">Resolved</span>',
            date(config("constants.ADMIN_DATE_FORMAT") , strtotime($record->created_at)),
            $options
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
}
