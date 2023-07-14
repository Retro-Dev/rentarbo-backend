<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PublicUser;
use App\Http\Resources\Product;

class Comment extends JsonResource
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
            "id"=> $this->id,
            "user_id"=> $this->user_id,
            "booking_id"=> $this->booking_id,
            "product_id"=> $this->product_id,
            "slug"=> $this->slug,
            "comment"=>$this->comment,
            "rating"=> $this->rating,
            "deleted_at"=> $this->deleted_at,
            "created_at"=> $this->created_at,
            "updated_at"=> $this->updated_at,
            "user"=>new PublicUser($this->whenLoaded('user')),
            'product'=>new Product($this->whenLoaded('product')),
            
       ];
    }
}
