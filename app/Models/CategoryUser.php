<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoryUser extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'category_users';

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
    protected $fillable = ['user_id','category_id','created_at','updated_at','deleted_at'];

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
    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }
    public static function insertCategory($data){
        return self::insert($data);
    }
    public static function deleteCategory($userId){
        return self::where('user_id','=',$userId)->delete();
    }
    public static function getUserCategories($userId){
       return \DB::table('category_users')
        ->where('user_id',$userId)
        ->whereNull('deleted_at')
        ->pluck('category_id');
        
    }

}
