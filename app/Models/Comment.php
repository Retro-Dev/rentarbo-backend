<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'comments';

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
    protected $fillable = ['user_id','slug','booking_id','product_id','rating','comment','created_at','updated_at','deleted_at'];

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

    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
    public function booking(){
        return $this->belongsTo(Booking::class,'booking_id','id');
    }


    public function user(){
        return $this->belongsTo(User::class,'user_id','id');
    }

    public static function getAverageComments($productId){
        return self::select('id','product_id',\DB::raw('AVG(rating) as rating_average'),\DB::raw('count(*) as total_reviews'))
                 ->where('product_id','=',$productId)->first();
    }

}
