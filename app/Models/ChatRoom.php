<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ChatRoom extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'chat_rooms';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'created_by',
        'booking_id',
        'slug',
        'identifier',
        'title',
        'image_url',
        'description',
        'type',
        'member_limit',
        'is_anonymous',
        'status',
        'created_at',
        'updated_at',
        'deleted_at'
        ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = false;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days
    public static function insertData($data){
        return $dat=self::create($data);
    }

    public static function check_chat_room($data){
        return  $q=\DB::select("SELECT
        chat_rooms.id as chat_id,
        chat_room_users.user_id
    FROM
        chat_rooms
    INNER JOIN chat_room_users ON chat_rooms.id = chat_room_users.chat_room_id
    INNER JOIN users ON users.id = chat_room_users.user_id
    WHERE
        chat_room_users.user_id IN('".$data['user_id']."','".$data['current_id']."') GROUP BY (chat_rooms.id) HAVING (COUNT(chat_room_users.user_id))>1");
        
        return \DB::select("select chat_rooms.id,chat_room_users.user_id from chat_rooms join 
        chat_room_users on chat_rooms.id=chat_room_users.chat_room_id where chat_room_users.user_id in ('".$data['user_id']."','".$data['current_id']."')");
    }

}
