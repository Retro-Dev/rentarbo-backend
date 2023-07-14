<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
class Media extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'media';

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
        'module', 'module_id', 'filename', 'original_name', 'file_url', 'file_url_blur', 'thumbnail_url', 'mime_type',
        'file_type', 'driver', 'media_type', 'meta', 'created_at', 'updated_at', 'deleted_at'
    ];

    public static function media_upload($data){
        return self::insert($data);

    }

    public static function remove_media($id,$module){
       return self::where([['module','=',$module],['module_id','=',$id]])->update(['deleted_at'=>Carbon::now()]);
    }

    public static function getmedia($id,$module){
        return self::where([['module','=',$module],['module_id','=',$id],['deleted_at','=',NULL]])->get();
     }

     public static function remove_single_media($id,$module){
        return self::where([['module','=',$module],['id','=',$id]])->update(['deleted_at'=>Carbon::now()]);
     }
}
