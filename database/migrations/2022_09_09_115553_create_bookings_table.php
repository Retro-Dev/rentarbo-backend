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
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('product_owner_id')->constrained('users')->onDelete('cascade');
            $table->string('slug',100);
            $table->string('phone_no',100);
            $table->string('rentar_name',100);
            $table->text('details');
            $table->integer('duration')->default(0);
            $table->decimal('total_charges',8,2);
            $table->decimal('admin_tax',8,2);
            $table->decimal('net_amount',8,2);
            $table->decimal('stripe_fee',8,2)->nullable();
            $table->string('from_time',100);
            $table->string('to_time',100);
            $table->date('booking_date');
            $table->enum('demo_hosting',['yes','no']);
            $table->enum('booking_status',['pending','cancelled','rejected','accepted','completed','inprogress'])->default('pending');
            $table->enum('returned',[0,1])->default(0);
            $table->enum('is_repost',[0,1])->default(0);
            $table->datetime("returned_at")->nullable();
            $table->datetime('return_confirmed')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->index(['slug','product_id','user_id','rentar_name']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
};
