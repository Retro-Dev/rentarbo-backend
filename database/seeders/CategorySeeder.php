<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        \DB::table('categories')->insert([
            ['name'=>"Property",'slug'=>'Property','description'=>"A boat is a watercraft of a large range of types and sizes, but generally smaller than a ship, which is distinguished by its larger size, shape, cargo or passenger capacity, or its ability to carry boats",'created_at' => Carbon::now(),'image_url'=>'category/boat.jpg'],
            ['name'=>"Vehicles",'slug'=>'Vehicles','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg'],
            ['name'=>"Bikes",'slug'=>'Bikes','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg'],
            ['name'=>"Books",'slug'=>'Books','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg'],
            ['name'=>"Electronics",'slug'=>'Electronics','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg'],
            ['name'=>"Home Appliances",'slug'=>'home-appliances','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg'],
            ['name'=>"Musical Instruments",'slug'=>'musical-instruments','description'=>"A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods",'created_at' => Carbon::now(),'image_url'=>'category/car.jpg']]);

    }
}
