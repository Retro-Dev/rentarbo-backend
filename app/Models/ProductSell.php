<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductSell extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'product_sells';

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
    protected $fillable = ['product_id','user_id','additional_info','name','phone_number','hosting_demo','product_owner_id','slug','total_charges',
     'stripe_fee','admin_tax','net_amount','sell_status','picked_up_status','picked_up','delivered_status',
     'delivered_at','created_at','updated_at','deleted_at'
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

    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
    public function rentar(){
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function owner(){
        return $this->belongsTo(User::class,'product_owner_id','id');
    }
     
    public static function getBySlug($slug){
        return self::where('slug','=',$slug)->first();
    }
    public static function checkSellByProduct($product_id){
        return self::where([['sell_status','=','accepted'],['product_id','=',$product_id]])->first();
    }

}
