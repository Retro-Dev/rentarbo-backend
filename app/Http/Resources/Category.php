<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;
use URL;
class Category extends JsonResource
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
         'name'=>$this->name,
         'slug'=>$this->slug,
         'description'=>$this->description,
         'image_url'=> !empty($this->image_url) ? Storage::url($this->image_url) : URL::to('images/user-placeholder.jpg'),
     ];
    }
}
