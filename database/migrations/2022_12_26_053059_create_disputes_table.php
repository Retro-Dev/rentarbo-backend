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
        Schema::create('disputes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('product_owner_id')->constrained('users')->onDelete('cascade');
            $table->string('module');
            $table->bigInteger('module_id');
            $table->string('slug',100);
            $table->text('description');
            $table->enum('dispute_status',['declined','progress','disputed','pending'])->default('pending');
            $table->text('declined_dispute_reason')->nullable();
            $table->enum('admin_status',['pending','resolved'])->default('pending');
            $table->timestamps();
            $table->softDeletes($column = 'deleted_at', $precision = 0);
            $table->index(['slug','module','module_id','user_id']);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disputes');
    }
};
