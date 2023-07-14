<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('category_id')->constrained('categories')->onDelete('cascade');
            $table->string('name',100);
            $table->string('slug',100);
            $table->text('description');
            $table->text('tags')->nullable();
            $table->enum('rent_type',['hr','day']);
            $table->decimal('rent_charges',8,2);
            $table->decimal('sell_price',8,2);
            $table->text('pick_up_location_address');
            $table->string('pickup_lat',191);
            $table->string('pickup_lng',191); 
            $table->text('drop_location_address');
            $table->string('drop_lat',191);
            $table->string('drop_lng',191);
            $table->string('ssn',100);
            $table->string('id_card',100);
            $table->string('driving_license',100);
            $table->enum('hosting_demos',[1,0])->default(0);
            $table->tinyInteger('status')->default(1);
            $table->string('rating')->default(0);
            $table->string('reviews')->default(0);
            $table->tinyInteger('is_approved')->default(0);
            $table->tinyInteger('is_sell')->default(0);
            $table->tinyInteger('is_rent')->default(0);
            $table->tinyInteger('sell_status')->default(0);

            $table->timestamps();
            $table->softDeletes();
            $table->index(['name','category_id','user_id','pickup_lng','pickup_lat']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
};
