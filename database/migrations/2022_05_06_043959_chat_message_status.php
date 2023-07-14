<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChatMessageStatus extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_message_status', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('chat_room_id')->constrained('chat_rooms')->onDelete('cascade');
            $table->integer('chat_message_id')->constrained('chat_messages')->onDelete('cascade');
            $table->tinyInteger('is_read')->default(0);
            $table->timestamps();
            $table->softDeletes();

            $table->index(["user_id", "chat_room_id", "chat_message_id"]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_message_status');
    }
}
