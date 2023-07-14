<?php

namespace App\Providers;

use App\Models\CmsModule;
use App\Models\Notification;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('admin/*', function ($view) {
            if(currentUser()){
                $notifications=Notification::with('sender')->where('target_id','=',currentUser()->id)->orderBy('id','desc')->get();
                $view->with('notifications',$notifications);
            }
            $getCmsModules = CmsModule::getUserModules();
            $view->with('cmsModules',$getCmsModules);
           
        });
    }
}
