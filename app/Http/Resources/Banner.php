<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Banner extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       return [
        'id'=>$this->id,
        'slug'=>$this->slug,
        'title'=>$this->title,
        'description'=>$this->description,
        'image_url'=>Storage::url($this->image_url)
       ];
    }
}
