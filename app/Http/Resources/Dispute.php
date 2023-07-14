<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\MediaResource;
use App\Http\Resources\PublicUser;

class Dispute extends JsonResource
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
        'id' =>$this->id,
        'module_id' =>$this->module_id,
        'module' =>$this->module,
        'user_id' =>$this->user_id,
        'slug' =>$this->slug,
        'description' =>$this->description,
        'dispute_status' =>$this->dispute_status,
        'declined_dispute_reason' =>$this->declined_dispute_reason,
        'admin_status' =>$this->admin_status,
        'created_at' =>$this->created_at,
        "images"=>MediaResource::collection($this->whenLoaded('images')),
        "user"=>new PublicUser($this->whenLoaded('user')),
       ];
    }
}
