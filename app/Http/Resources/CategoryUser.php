<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Category;

class CategoryUser extends JsonResource
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
        "id"=>$this->id,
        "user_id"=>$this->user_id,
        "category_id"=>$this->category_id,
        "category"=>new Category($this->whenLoaded('category')),


       ];
    }
}
