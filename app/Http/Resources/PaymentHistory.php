<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class PaymentHistory extends JsonResource
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
            'id'               => $this->id,
            'sender_id'        => $this->sender_id,
            'receiver_id'      => $this->receiver_id,
            'charge_amount'    => $this->total_charges,
            'net_amount'       => $this->net_amount,
            'platform_fee'     => $this->admin_tax,
            'sender'           => $this->whenLoaded('sender'),
            'receiver'         => $this->whenLoaded('receiver'),
            'created_at'       => $this->created_at,
       ];
    } 
}
