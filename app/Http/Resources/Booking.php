<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\MediaResource;
use App\Http\Resources\PublicUser;
use App\Http\Resources\Product;

class Booking extends JsonResource
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
         'user_id'=>$this->user_id,
         'product_owner_id'=>$this->product_owner_id,
         'slug'=>$this->slug,
         'product_id'=>$this->product_id,
         'rentar_name'=>$this->rentar_name,
         'phone_no'=>$this->phone_no,
         'details'=>$this->details,
         'duration'=>$this->duration,
         'total_charges'=>$this->total_charges,
         'admin_tax'=>$this->admin_tax,
         'net_amount'=>$this->net_amount,
         'demo_hosting'=>$this->demo_hosting,
         'booking_status'=>$this->booking_status,
         'returned_at'=>$this->returned_at,
         'from_time'=> $this->from_time,   
         'to_time'=> $this->to_time,  
         'is_repost'=>$this->is_repost, 
         'booking_date'=>$this->booking_date,
         'returned'=>$this->returned,
         'return_confirmed'=> $this->return_confirmed,   
         'created_at'=> $this->created_at,
         'rentar'=>new PublicUser($this->whenLoaded('rentar')),
         "owner"=>new PublicUser($this->whenLoaded('owner')),
         'product'=>new Product($this->whenLoaded('product')),
         "return_condition"=>MediaResource::collection($this->whenLoaded('return_conditions')),
         "license"=>MediaResource::collection($this->whenLoaded('license')),
         "rating"=>$this->whenLoaded('comment'),



         

       ];
    }
}
