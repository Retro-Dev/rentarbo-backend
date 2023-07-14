<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
class Banner extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $data=[
          [
            'slug'=>uniqid(),
            'image_url'=>uploadMediaByPath('banners',public_path('images/cycle.jpg')),
            'title'=>'Cycle',
            'description'=>'Cycle Media is a burgeoning marketing and content creation conglomerate, which consists of the ad agency Laundry Service and the distributed publisher Cycle. In 2015, Wasserman acquired Laundry Service, which incubated and then spun out the influencer marketing and media network Cycle',
            'created_at'=>Carbon::now()
         ],
          [
            'slug'=>uniqid(),
            'image_url'=>uploadMediaByPath('banners',public_path('images/boat.jpg')),
            'title'=>'Boat',
            'description'=>'Boat Media is a burgeoning marketing and content creation conglomerate, which consists of the ad agency Laundry Service and the distributed publisher Cycle. In 2015, Wasserman acquired Laundry Service, which incubated and then spun out the influencer marketing and media network Cycle',
            'created_at'=>Carbon::now()
         ]
       ];
        \DB::table('ad_banners')->insert($data);
    }
}
