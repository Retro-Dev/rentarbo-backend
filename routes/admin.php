<?php

use App\Http\Controllers\Admin\ContentManagementController;
use App\Http\Controllers\Admin\FaqController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\Auth\ForgotPasswordController;
use App\Http\Controllers\Admin\Auth\ResetPasswordController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\CmsUserController;
use App\Http\Controllers\Admin\CmsRoleController;
use App\Http\Controllers\Admin\ApplicationSettingController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\DisputeController;
use App\Http\Controllers\Admin\BookingController;
use App\Http\Controllers\Admin\CommentController;
use App\Http\Controllers\Admin\NotificationController;
use App\Http\Controllers\Admin\UserTransactionController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\ProductSellController;









/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
*/
Route::prefix('admin')->group(function () {

    Route::middleware(['guest:web'])->group( function(){

        Route::match( ['get','post'],'login', [ LoginController::class,'login' ])->name('admin.login');
        Route::match( ['get','post'],'forgot-password', [ ForgotPasswordController::class,'forgotPassword' ])->name('admin.forgot-password');
        Route::match( ['get','post'],'reset-password/{any}', [ ResetPasswordController::class,'resetPassword' ])->name('admin.reset-password');

    });

    Route::middleware(['custom_auth:web'])->group( function(){

        Route::match(['get','post'],'profile',[CmsUserController::class,'profile'])->name('admin.profile');
        Route::match(['get','post'],'change-password',[CmsUserController::class,'changePassword'])->name('admin.change-password');
        Route::get('logout',[CmsUserController::class,'logout'])->name('admin.logout');

        Route::get('dashboard',[DashboardController::class,'index'])->name('admin.dashboard');
        Route::get('dashboard/small-widget',[DashboardController::class,'getSmallWidget'])->name('admin.dashboard.small-widget');
        Route::get('dashboard/line-chart',[DashboardController::class,'getLineChart'])->name('admin.dashboard.line-chart');

        Route::get('cms-roles-management/ajax-listing',[CmsRoleController::class,'ajaxListing'])->name('cms-roles-management.ajax-listing');
        Route::resource('cms-roles-management',CmsRoleController::class);

        Route::get('cms-users-management/ajax-listing',[CmsUserController::class,'ajaxListing'])->name('cms-users-management.ajax-listing');
        Route::resource('cms-users-management',CmsUserController::class);

        Route::match(['get','post'],'application-setting',[ApplicationSettingController::class,'index'])->name('admin.application-setting');

        Route::get('app-users/ajax-listing',[UserController::class,'ajaxListing'])->name('app-users.ajax-listing');
        Route::resource('app-users',UserController::class);

        Route::get('content-management/ajax-listing',[ContentManagementController::class,'ajaxListing'])->name('content-management.ajax-listing');
        Route::resource('content-management',ContentManagementController::class);

        Route::get('faq/ajax-listing',[FaqController::class,'ajaxListing'])->name('faq.ajax-listing');
        Route::resource('faq',FaqController::class);

        Route::get('category/ajax-listing',[CategoryController::class,'ajaxListing'])->name('category.ajax-listing');
        Route::resource('category',CategoryController::class);

        Route::get('dispute/ajax-listing',[DisputeController::class,'ajaxListing'])->name('dispute.ajax-listing');
        Route::resource('dispute',DisputeController::class);
        Route::get('sell/ajax-listing',[ProductSellController::class,'ajaxListing'])->name('sell.ajax-listing');
        Route::resource('sell',ProductSellController::class);


        Route::get('product/ajax-listing',[ProductController::class,'ajaxListing'])->name('product.ajax-listing');
        Route::resource('product',ProductController::class);

        Route::get('booking/ajax-listing',[BookingController::class,'ajaxListing'])->name('booking.ajax-listing');
        Route::resource('booking',BookingController::class);

        Route::get('contact/ajax-listing',[ContactController::class,'ajaxListing'])->name('contact.ajax-listing');
        Route::resource('contact',ContactController::class);

        Route::get('user-transaction/ajax-listing',[UserTransactionController::class,'ajaxListing'])->name('user-transaction.ajax-listing');
        Route::resource('user-transaction',UserTransactionController::class);

        Route::get('reviews/ajax-listing',[CommentController::class,'ajaxListing'])->name('reviews.ajax-listing');
        Route::resource('reviews',CommentController::class);

        Route::get('notification/ajax-listing',[NotificationController::class,'ajaxListing'])->name('notification.ajax-listing');
        Route::resource('notification',NotificationController::class);
        Route::post('notification/send',[NotificationController::class,'sendPush'])->name('notification.send');


        
    });

});
