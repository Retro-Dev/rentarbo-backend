<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\FaqController;
use App\Http\Controllers\Api\GeneralController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\CategoryUserController;
use App\Http\Controllers\Api\UserCardController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\DisputeController;
use App\Http\Controllers\Api\ProductSellController;
use App\Http\Controllers\Api\ChatRoomUserController;









/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['api_authorization'])->group(function(){

    Route::post('generate-secret',[GeneralController::class,'generateSecret']);

    Route::post('user/login',[UserController::class,'login']);
    Route::post('user/forgot-password',[UserController::class,'forgotPassword']);
    Route::post('user/change-password',[UserController::class,'changePassword']);
    Route::post('user/logout',[UserController::class,'userLogout']);
    Route::post('user/social-login',[UserController::class,'socialLogin']);
    Route::post('user/verify-code',[UserController::class,'verifyCode']);
    Route::post('user/resend-code',[UserController::class,'resendCode']);
    Route::resource('user',UserController::class)->except(['delete']);

    Route::resource('faq',FaqController::class)->only('index');

    Route::post('generate-video-thumb',[GeneralController::class,'generateVideoThumb']);
    Route::get('content',[FaqController::class,'content']);
    Route::post('chat/send-notification',[NotificationController::class,'sendChatNotification']);


    Route::middleware(['custom_auth:api'])->group(function(){

        Route::get('notification',[NotificationController::class,'index']);
        Route::put('notification/{any}',[NotificationController::class,'update']);
        Route::post('notification/send',[NotificationController::class,'sendNotification']);
        Route::post('notification/setting',[NotificationController::class,'saveNotificationSetting']);
        Route::get('notification/setting',[NotificationController::class,'getNotificationSetting']);
        Route::get('notification/badge',[NotificationController::class,'badgeCount']);
        
        Route::resource('category',CategoryController::class);
        Route::post('product/repost',[ProductController::class,'repost'])->name('product.repost');

        Route::resource('product',ProductController::class);
        Route::get('booking-availability',[BookingController::class,'check_availability'])->name('booking.availability');

        Route::resource('booking',BookingController::class);
        Route::resource('comment',CommentController::class)->only('store','index');
        
        Route::resource('banner',BannerController::class)->only('index');
       
        Route::resource('contact-us',ContactController::class)->only('store');
        
        Route::post('user-category',[CategoryController::class,'createUserCatetgory']);
        Route::resource('user-category',CategoryUserController::class)->only('index');

        Route::resource('dispute',DisputeController::class);
        Route::post('create-chat',[ChatRoomUserController::class,'create_chat']);

       
        Route::resource('gateway/card',UserCardController::class);
        Route::resource('sell',ProductSellController::class);

        Route::post('remove-media',[FaqController::class,'remove_media']);
        Route::post('upload-media',[FaqController::class,'upload_media']);
        Route::get('payment/history',[UserController::class,'paymentHistory']);

        Route::controller(PaymentController::class)->prefix('payout')->group(function () {
            Route::post('external-account', 'addExternalAccount');
            Route::get('external-account', 'getExternalAccount');
            Route::post('personal-info', 'savePersonalInfo');
            Route::get('personal-info', 'getPersonalInfo');
            Route::get('check-status', 'checkAccountStatus');
            Route::get('earning', 'earning');



        });

    });
});
