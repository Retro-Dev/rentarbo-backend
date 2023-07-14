<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserTransaction extends Model
{
    use HasFactory, CRUDGenerator, SoftDeletes;
    protected $fillable=[
        'sender_id',
        'receiver_id',
        'module',
        'module_id',
        'gateway_transaction_id',
        'gateway_response',
        'total_charges',
        'admin_tax',
        'net_amount',
        'stripe_fee',
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    public function sender()
    {
        $storage_url     = Storage::url('/');
        $placeholder_url = \URL::to('images/user-placeholder.jpg');
        return $this->belongsTo(User::class,'sender_id','id')
                    ->select('id','name','slug','email','mobile_no')
                    ->selectRaw("IF(image_url IS NOT NULL, CONCAT('$storage_url',image_url), '$placeholder_url') AS image_url ");
    }


   
    public function receiver()
    {
        $storage_url     = Storage::url('/');
        $placeholder_url = \URL::to('images/user-placeholder.jpg');
        return $this->belongsTo(User::class,'receiver_id','id')
                    ->select('id','name','slug','email','mobile_no')
                    ->selectRaw("IF(image_url IS NOT NULL, CONCAT('$storage_url',image_url), '$placeholder_url') AS image_url ");
    }
    public function booking(){
        return $this->belongsTo(Booking::class,'module_id','id');
    }
    public function sell(){
        return $this->belongsTo(ProductSell::class,'module_id','id');
    }

    public static function getPaymentHistory($user_id,$type)
    {
        $query = self::with(['sender','receiver']);
        if( $type == 'debit' ){
            $query->where('sender_id',$user_id);
        } else {
            $query->where('receiver_id',$user_id);
        }
        $records = $query->orderBy('id','desc')->paginate(config('constants.PAGINATION_LIMIT'));
        return $records;
    }


    public static function getOwnerEarning($ownerID){
        $graph=self::selectRaw("sum(net_amount) as earning,
                   DATE_FORMAT(created_at,'%m') as months")
                   ->groupBy('months')
                   ->orderBy('created_at', 'ASC')
                    ->where('receiver_id','=',$ownerID)
                   ->whereYear('created_at',date('Y'))
                   ->get();
       $total=self::selectRaw("sum(net_amount) as earning")->where('receiver_id','=',$ownerID)
                   ->first();
                   return ['graph_data'=>$graph,'total'=>$total->earning];
                  
   }
}
