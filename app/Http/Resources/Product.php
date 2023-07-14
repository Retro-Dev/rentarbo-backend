<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\MediaResource;
use App\Http\Resources\PublicUser;
use App\Http\Resources\Category;


class Product extends JsonResource
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
                "name"=>$this->name,
                "slug"=>$this->slug,
                "description"=>$this->description,
                "tags"=>json_decode($this->tags),
                "rent_type"=>$this->rent_type,
                "rent_charges"=>$this->rent_charges,
                "sell_price"=>$this->sell_price,
                "pick_up_location_address"=>$this->pick_up_location_address,
                "pickup_lat"=>$this->pickup_lat,
                "pickup_lng"=>$this->pickup_lng,
                "drop_location_address"=>$this->drop_location_address,
                "drop_lat"=>$this->drop_lat,
                "drop_lng"=>$this->drop_lng,
                "ssn"=>$this->ssn,
                "id_card"=>$this->id_card,
                "driving_license"=>$this->driving_license,
                "hosting_demos"=>$this->hosting_demos,
                "rating"=>round($this->rating,1),
                "reviews"=>$this->reviews,
                "is_sell"=>$this->is_sell,
                "is_rent"=>$this->is_rent,
                "sell_status"=>$this->sell_status,
                "status"=>$this->status,
                "is_approved"=>$this->is_approved,
                "pending_request"=>$this->whenLoaded('pending_request')?1:0,
                "category"=>new Category($this->whenLoaded('category')),
                "owner"=>new PublicUser($this->whenLoaded('owner')),
                "media"=>MediaResource::collection($this->whenLoaded('media')),
                "image"=>new MediaResource($this->whenLoaded('image'))

          ];
    }
}
