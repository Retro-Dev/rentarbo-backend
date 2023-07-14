<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Product extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'products';

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
        "category_id",
        "user_id",
        "name",
        "slug",
        "description",
        "tags",
        "rent_type",
        "rent_charges",
        "pick_up_location_address",
        "pickup_lat",
        "pickup_lng",
        "drop_location_address",
        "drop_lat",
        "drop_lng",
        "ssn",
        "id_card",
        "driving_license",
        "hosting_demos",
        "deleted_at",
        "status",
        "rating",
        "reviews",
        'is_sell',
        'is_rent',
        'sell_status',
        'sell_price',
        "is_approved",
        "created_at",
        "updated_at", 
        "deleted_at"

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

    public function owner(){
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }

    public function media(){
        return $this->hasMany(Media::class,'module_id','id')
        ->where([['module','=','products'],['deleted_at','=',NULL]]);
    }
    public function image(){
        return $this->hasOne(Media::class,'module_id','id')
        ->where('module','=','products');
    }

    public static function getById($id){
        return self::findOrFail($id);
    }
    public static function getProductBySlug($slug){
        return self::where([['slug','=',$slug],['deleted_at','=',null]])->first();
    }
    public static function updateProduct($data,$productId){
        return self::where('id','=',$productId)->update($data);
    }
    public function pending_request(){
        return $this->hasOne(Booking::class,'product_id','id')
        ->where('booking_status','=','pending')->orderBy('id','DESC');
    }

}
