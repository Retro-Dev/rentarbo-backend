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
        Schema::create('product_sells', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('product_owner_id')->constrained('users')->onDelete('cascade');
            $table->string('slug',100);
            $table->decimal('total_charges',8,2)->nullable();
            $table->decimal('stripe_fee',8,2)->nullable();
            $table->decimal('admin_tax',8,2)->nullable();
            $table->decimal('net_amount',8,2)->nullable();
            $table->enum('sell_status',['pending','rejected','completed','accepted','cancelled']);
            $table->enum('picked_up_status',[0,1])->default(0);
            $table->datetime('picked_up')->nullable();
            $table->enum('delivered_status',[0,1])->default(0);
            $table->enum('hosting_demo',[0,1])->default(0);
            $table->datetime('delivered_at')->nullable();
            $table->string('name',100);
            $table->string('phone_number',100);
            $table->text('additional_info')->nullable();
            $table->timestamps();
            $table->softDeletes($column = 'deleted_at', $precision = 0);
            $table->index(['slug','product_owner_id','user_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_sells');
    }
};
