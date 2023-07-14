<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'bookings';

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
        'slug','product_id',
        'rentar_name',
        'phone_no',
        'details',
        'duration',
        'total_charges',
        'admin_tax',
        'stripe_fee',
        'from_time',
        'to_time',
        'booking_date',
        'net_amount',
        'demo_hosting',
        'booking_status',
        'returned_at',
        'returned',
        'return_confirmed', 
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

    public function product(){
        return $this->belongsTo(Product::class,'product_id','id')->withTrashed();
    }
    public function rentar(){
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function owner(){
        return $this->belongsTo(User::class,'product_owner_id','id');
    }
     public function comment(){
        return $this->hasOne(Comment::class,'booking_id','id');
    }
    public function return_conditions(){
        return $this->hasMany(Media::class,'module_id','id')
               ->where('module','=','returned');
    }

    public function license(){
        return $this->hasMany(Media::class,'module_id','id')
               ->where('module','=','bookings');
    }
    public static function getBySlug($slug=null){
        return self::with('product')->where('slug','=',$slug)->first();
    }
    public static function getById($id){
        return self::with('comment')->findOrFail($id);
    }
    public static function updateBooking($respost_data,$id){
        return self::where([['id','=',$id]])->update($respost_data);

    }
    // public static function checkProductAvailablity($productID){
    //     return self::where([['product_id','=',$productID],['booking_status','=','progress']])->first();
    // }
    
    
    public static function update_booking($productID,$slug){
        // return self::where([['product_id','=',$productID],['slug','<>',$slug]])->update(['booking_status','=','rejected']);
    }

    public static function check_booking_availability($type_filter=null,$product_id){
        $booked_slot=array();
        if(!empty($type_filter)){
        $slots= self::select('to_time','from_time')->where([['product_id','=',$product_id],['booking_date','=',$type_filter]])->get()->toArray();
          if(!empty($slots)){
            foreach($slots as $slot){
                $booked_slot[]=$slot;
            }
            return  $booked_slot;

          }  
        }else{
            $slots= self::where([['product_id','=',$product_id],['from_time','>=',Carbon::now()->format('Y-m-d')]])
            ->get();
            if(!empty($slots)){
                foreach($slots as $slot){
                $period = new \DatePeriod(
                    new \DateTime($slot['from_time']),
                    new \DateInterval('P1D'),
                    new \DateTime(date('Y-m-d H:i:s', strtotime($slot['to_time'] . ' +1 day')))
               );
               //Which should get you an array with DateTime objects. 
               //To iterate
               foreach ($period as $key => $value) {
                $booked_slot[]=$value->format('Y-m-d');     
               }
            }
          }
          return  $booked_slot;
        }
    }

    
    public static function checkBookingValidation($checkInDate,$checkOutDate,$postID){
        return \DB::table('bookings')->where(function ($q) use ($checkInDate,$checkOutDate,$postID){
            $q->where([['from_time','<',$checkInDate],['to_time','>',$checkInDate],['product_id','=',$postID]]);
        })->orWhere(function ($q) use ($checkInDate,$checkOutDate,$postID){
            $q->where([['from_time','<',$checkOutDate],['to_time','>',$checkOutDate],['product_id','=',$postID]]);
        })->orWhere(function ($q) use ($checkInDate,$checkOutDate,$postID){
            $q->where([['from_time','>',$checkInDate],['to_time','<',$checkOutDate],['product_id','=',$postID]]);
        })->get();

    }
    public static function checkBookingByProduct($product_id){
        return self::where([['booking_status','=','inprogress'],['product_id','=',$product_id]])->first();
    }
}
