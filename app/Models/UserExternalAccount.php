<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserExternalAccount extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id','gateway_external_account_id','account_holder_name','last4_digit',
        'is_default','created_at','updated_at','deleted_at'
    ];

    public static function getExternalAccountByUserID($user_id)
    {
        $query = self::where('user_id',$user_id)->first();
        return $query;
    }

    public static function createExtAccount($params,$external_account)
    {
        $connect_account = $external_account['connect_account'];
        $updated_params = [
            'user_id' => $params['user']->id,
            'gateway_external_account_id' => $connect_account->id,
            'account_holder_name' => $connect_account->account_holder_name,
            'last4_digit' =>  $connect_account->last4,
            'is_default' => '1',
            'created_at' => now()
        ];
        $record = self::updateOrCreate(
            ['user_id' => $params['user']->id],
            $updated_params
        );
        return $record;
    }

    
}
