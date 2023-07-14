<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use FFMpeg;

class GeneralController extends Controller
{
    public function generateSecret(Request $request)
    {
        $data['secret'] = bin2hex(openssl_random_pseudo_bytes(16));
        $data['iv']     = bin2hex(openssl_random_pseudo_bytes(16));

        file_put_contents(resource_path('secret-key/secret.txt'),$data['secret']);
        file_put_contents(resource_path('secret-key/iv.txt'),$data['iv']);

        $this->__collection  = false;
        $this->__is_paginate = false;

        return $this->__sendResponse($data, 200, 'Secret has been generated successfully');
    }

    public function generateVideoThumb(Request $request)
    {
        $file = $request->file('file');
        return generateVideoThumb($file->getPathName(),public_path('image.jpg'));
        echo 'success'; exit;
    }

    public function dataTruncate(Request $request)
    {
        $data = array();

        \DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        if ($request->password != "Admin@123!") {
            return response()->json([
                'code' => 200,
                'data' => ['message' => 'Password is required.'],
                'message' => 'Password is required.'
            ], 200);
        } else {
            \DB::table('chat_message_status')->truncate();
            \DB::table('chat_room_status')->truncate();
            \DB::table('chat_room_users')->truncate();
            \DB::table('chat_messages')->truncate();
            \DB::table('chat_rooms')->truncate();
            \DB::table('comments')->truncate();
            \DB::table('contact_us')->truncate();
            \DB::table('media')->truncate();
            \DB::table('disputes')->truncate();
            \DB::table('notifications')->truncate();
            \DB::table('notification_setting')->truncate();
            \DB::table('products')->truncate();
            \DB::table('product_sells')->truncate();
            \DB::table('user_cards')->truncate();
            \DB::table('bookings')->truncate();
            \DB::table('booking_statuses')->truncate();
            \DB::table('users')->truncate();
            \DB::table('category_users')->truncate();
            \DB::table('user_api_token')->truncate();
            \DB::table('user_connect_accounts')->truncate();
            \DB::table('user_external_accounts')->truncate();

            \DB::table('reset_password')->truncate();
            \DB::table('users')->insert([
                ["user_group_id"=>1, "user_type" => "admin",
                 "name" => "RetroCube","username" => "retrocube", "slug" => "retrocube",
                 "email" => "admin@retrocube.com","mobile_no" => "1-8882051816",
                 "password" => '$2y$10$Vb3lAYbr1p6R3LxzGx2.9u8VJi3QeUsa9MKmO7CkTHGNZv4ad/VIm',
                 "status" => 1, "is_email_verify" => 1, "email_verify_at" => Carbon::now(),
                 "is_mobile_verify"=>1, "mobile_verify_at" => Carbon::now(),
                 "created_at"=>Carbon::now()
                ],
                [
                 "user_group_id"=>1, "user_type" => "admin",
                 "name" => "Perch Finder", "username" => "perchfinder", "slug" => "perchfinder",
                 "email" => "admin@perchfinder.com","mobile_no" => "1-8882051817",
                 "password" => '$2y$10$Vb3lAYbr1p6R3LxzGx2.9u8VJi3QeUsa9MKmO7CkTHGNZv4ad/VIm',
                 "status" => 1, "is_email_verify" => 1, "email_verify_at" => Carbon::now(),
                 "is_mobile_verify"=>1, "mobile_verify_at" => Carbon::now(),
                 "created_at"=>Carbon::now()
                 ]
            ]);
            \DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            $this->__is_paginate = false;
            $this->__collection = false;
        }

        return $this->__sendResponse([], 200, 'Data has been deleted successfully');
    }
}
