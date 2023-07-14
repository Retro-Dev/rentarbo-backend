<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ProductController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('Product');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Ads';
        $this->__indexView  = 'product.index';
        $this->__createView = 'product.add';
        $this->__editView   = 'product.edit';
        $this->__detailView = 'product.detail';
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
                    'is_approved' => 'required|in:0,1',
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
        $options  = '<a href="'. route('product.edit',['product' => $record->slug]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a> ';
        $options  .= '<a href="'. route('product.show',['product' => $record->slug]) .'" title="Show" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a>';

        return [
            // '<input type="checkbox" name="record_id[]" class="record_id" value="'. $record->slug .'">',
            $record->name,
            $record->category->name,
            $record->owner->name,
            $record->status == 1 ? '<span class="btn btn-xs btn-success">Available</span>' : '<span class="btn btn-xs btn-danger">Booked</span>',
            $record->is_approved == 1 ? '<span class="btn btn-xs btn-success">Approved</span>' : '<span class="btn btn-xs btn-danger">Not Approved</span>',
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
