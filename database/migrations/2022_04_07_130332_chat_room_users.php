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
        Schema::create('chat_room_users', function (Blueprint $table) {
            $table->id();
            $table->foreignId('chat_room_id')->constrained('chat_rooms')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->integer('last_chat_message_id');
            $table->dateTime('last_message_timestamp')->nullable();
            $table->integer('unread_message_counts')->default(0);
            $table->tinyInteger('is_anonymous')->default(0);
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('is_owner')->default(0);
            $table->timestamps();
            $table->softDeletes();

            $table->index(["last_message_timestamp", "status", "is_owner"]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_room_users');
    }
};
