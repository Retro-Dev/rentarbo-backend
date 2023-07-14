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
        Schema::create('chat_messages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('chat_room_id')->constrained('chat_rooms')->onDelete('cascade');
            $table->text('message')->nullable()->collation("utf8mb4_unicode_ci");
            $table->string('message_type',33)->default("text")->collation("utf8mb4_unicode_ci");
            $table->text('file_url')->nullable();
            $table->text('file_data')->nullable();
            $table->text('custom_data')->nullable();
            $table->string('ip_address')->nullable();
            $table->tinyInteger('is_anonymous')->default(0);
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
            $table->softDeletes();

            $table->index(["message_type", "status"]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_messages');
    }
};
