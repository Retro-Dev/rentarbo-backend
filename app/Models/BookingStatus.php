<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingStatus extends Model
{
    use HasFactory;
    protected $fillable=['user_id','booking_id','type','type_value','created_at','updated_at','deleted_at'];

    public static function createBookingStatus($data){
        return self::insert($data);
    }
}
