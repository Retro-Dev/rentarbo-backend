<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

class MediaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "id"=>$this->id,
            'thumbnail_url'=>Storage::url($this->thumbnail_url),   
            'module'=>$this->module, 
            'module_id'=>$this->module_id, 
            'filename'=>$this->filename, 
            'original_name'=>$this->original_name,
            'file_url'=>Storage::url($this->file_url),   
            'mime_type'=>$this->mime_type,
            'file_type'=>$this->file_type,   
            'created_at'=>$this->created_at];
    
    }
}
