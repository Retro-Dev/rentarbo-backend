<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\MediaResource;
use App\Http\Resources\PublicUser;
use App\Http\Resources\Product;
class ProductSell extends JsonResource
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
        'rname'=>$this->rname,
        'phone_number'=>$this->phone_number,
        'additional_info'=>$this->additional_info,
        'total_charges'=>$this->total_charges,
        'admin_tax'=>$this->admin_tax,
        'net_amount'=>$this->net_amount,
        'demo_hosting'=>$this->demo_hosting,
        'sell_status'=>$this->sell_status,
        'picked_up_status'=>$this->picked_up_status,
        'picked_up'=> $this->picked_up,   
        'delivered_status'=> $this->delivered_status,   
        'delivered_at'=>$this->delivered_at,
        'created_at'=> $this->created_at,
        'rentar'=>new PublicUser($this->whenLoaded('rentar')),
        "owner"=>new PublicUser($this->whenLoaded('owner')),
        'product'=>new Product($this->whenLoaded('product')),

       ];
    }
}
