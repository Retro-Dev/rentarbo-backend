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
        Schema::create('user_transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sender_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('receiver_id')->constrained('users')->onDelete('cascade');
            $table->string('module');
            $table->integer('module_id');
            $table->string('gateway_transaction_id');
            $table->decimal('total_charges',8,2);
            $table->decimal('admin_tax',8,2);
            $table->decimal('net_amount',8,2);
            $table->decimal('stripe_fee',8,2)->nullable();
            $table->enum('gateway',['stripe','paypal'])->default('stripe');
            $table->text('gateway_response')->nullable();
            $table->enum('is_transfer',[1,0])->default(0);
            $table->timestamps();
            $table->softDeletes($column = 'deleted_at', $precision = 0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_transactions');
    }
};
