<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Dispute extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'disputes';

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
        'user_id',
        'product_owner_id',
        'module_id',
        'module',
        'slug',
        'description',
        'dispute_status',
        'declined_dispute_reason',
        'admin_status',
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

    public function user(){
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function booking(){
        return $this->belongsTo(Booking::class,'module_id','id');
    }
    public function sell(){
        return $this->belongsTo(ProductSell::class,'module_id','id');
    }
    public function images(){
        return $this->hasMany(Media::class,'module_id','id')
            ->where('module','=','disputes');
    }
    public static function getBySlug($slug)
    {
        $query = self::where('slug',$slug)->first();
        return $query;
    }

    public static function getDispute($id,$module){
        return self::where([['module_id','=',$id],['module','=',$module]])->first();
    }
}
