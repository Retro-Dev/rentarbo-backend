<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class CmsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->addCmsRoles();
        $this->addCmsUser();
        $this->addCmsModules();
        $this->mailTemplates();
        $this->addApplicationSettings();
        $this->cms_widget();
        $this->setPermissions();

    }

    public function addCmsRoles()
    {
       \DB::table('user_groups')->insert([
            [
                'title'          => 'Super Admin',
                'slug'           => Str::slug('Super Admin'),
                'type'           => 'admin',
                'is_super_admin' => '1',
                'created_at'     => Carbon::now()
            ],[
                'title' => 'App User',
                'slug'  => 'app-user',
                'type'          => 'user',
                'is_super_admin'=> '0',
                'created_at' => Carbon::now()
            ],
            [
                'title' => 'Admin',
                'slug'  => 'admin-user',
                'type'          => 'admin',
                'is_super_admin'=> '0',
                'created_at' => Carbon::now()
            ]
        ]);
    }

    public function addCmsUser()
    {
        $role = \DB::table('user_groups')->where('title','Super Admin')->first();
        \DB::table('users')->insert([
            'user_group_id' => $role->id,
            'user_type'   => 'admin',
            'name'        => 'RetroCube',
            'username'    => 'retrocube',
            'slug'        => 'retrocube',
            'email'       => 'admin@retrocube.com',
            'mobile_no'   => '1-8882051816',
            'password'    => Hash::make('admin@123$'),
            'is_email_verify' => '1',
            'email_verify_at' => Carbon::now(),
            'is_mobile_verify' => '1',
            'mobile_verify_at' => Carbon::now(),
            'created_at'  => Carbon::now(),
        ]);
        $role = \DB::table('user_groups')->where('title','Admin')->first();
        \DB::table('users')->insert([
            'user_group_id' => $role->id,
            'user_type'   => 'admin',
            'name'        => 'Admin',
            'username'    => 'Admin Rentarbo',
            'slug'        => 'admin-rentarbo',
            'email'       => 'admin@rentarbo.com',
            'mobile_no'   => '1-8882051810',
            'password'    => Hash::make('Admin@123'),
            'is_email_verify' => '1',
            'email_verify_at' => Carbon::now(),
            'is_mobile_verify' => '1',
            'mobile_verify_at' => Carbon::now(),
            'created_at'  => Carbon::now(),
        ]);
    }

    public function addCmsModules()
    {
        $data = [
            [
                'parent_id'    => 0,
                'name'         => 'Cms Roles Management',
                'route_name'   => 'cms-roles-management.index',
                'icon'         => 'fa fa-key',
                'status'       => '1',
                'sort_order'   => 1,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Cms Users Management',
                'route_name'   => 'cms-users-management.index',
                'icon'         => 'fa fa-users',
                'status'       => '1',
                'sort_order'   => 2,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Application Setting',
                'route_name'   => 'admin.application-setting',
                'icon'         => 'fa fa-cog',
                'status'       => '1',
                'sort_order'   => 3,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Users Management',
                'route_name'   => 'app-users.index',
                'icon'         => 'fa fa-users',
                'status'       => '1',
                'sort_order'   => 4,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Content Management',
                'route_name'   => 'content-management.index',
                'icon'         => 'fa fa-tasks',
                'status'       => '1',
                'sort_order'   => 5.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'FAQ`s',
                'route_name'   => 'faq.index',
                'icon'         => 'fa fa-question-circle-o',
                'status'       => '1',
                'sort_order'   => 6.0,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Category',
                'route_name'   => 'category.index',
                'icon'         => 'fa fa-square',
                'status'       => '1',
                'sort_order'   => 7.0,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Ads',
                'route_name'   => 'product.index',
                'icon'         => 'fa fa-database',
                'status'       => '1',
                'sort_order'   => 8.0,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Disputes',
                'route_name'   => 'dispute.index',
                'icon'         => 'fa fa-question-circle-o',
                'status'       => '1',
                'sort_order'   => 14.0,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Payment Management',
                'route_name'   => 'user-transaction.index',
                'icon'         => 'fa fa-money',
                'status'       => '1',
                'sort_order'   => 10.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Reviews',
                'route_name'   => 'reviews.index',
                'icon'         => 'fa fa-comments',
                'status'       => '1',
                'sort_order'   => 11.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Notification',
                'route_name'   => 'notification.index',
                'icon'         => 'fa fa-bell',
                'status'       => '1',
                'sort_order'   => 12.0,
                'created_at'   => Carbon::now()
            ]
            ,[
                'parent_id'    => 0,
                'name'         => 'Contact Us',
                'route_name'   => 'contact.index',
                'icon'         => 'fa fa-address-book',
                'status'       => '1',
                'sort_order'   => 13.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Bookings',
                'route_name'   => 'booking.index',
                'icon'         => 'fa-solid fa-book',
                'status'       => '1',
                'sort_order'   => 9.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Product Sell',
                'route_name'   => 'sell.index',
                'icon'         => 'fa fa-address-book',
                'status'       => '1',
                'sort_order'   => 13.0,
                'created_at'   => Carbon::now()
            ],
            
        ];
        \DB::table('cms_modules')->insert($data);
    }


    public function addApplicationSettings()
    {
        $data = [
            [
                'identifier' => 'application_setting',
                'meta_key' => "favicon",
                'value' => uploadMediaByPath('app_setting',public_path('images/favicon.png')),
                'is_file' => 1,
                'created_at' => Carbon::now()
            ],
            [
                'identifier' => 'application_setting',
                'meta_key' => "logo",
                'value' => uploadMediaByPath('app_setting',public_path('images/logo.jpg')),
                'is_file' => 1,
                'created_at' => Carbon::now()
            ],
            [
                'identifier' => 'application_setting',
                'meta_key' => "application_name",
                'value' => 'RetroCube',
                'is_file' => 0,
                'created_at' => Carbon::now()
            ]
        ];
        \DB::table('application_setting')->insert($data);
    }


    public function mailTemplates()
    {
        $forgot_password_template = file_get_contents(__DIR__ . '/forgot_password_template_body.blade.php',FILE_USE_INCLUDE_PATH);
        $user_register_template =  file_get_contents(__DIR__ . '/user_register_template_body.blade.php',FILE_USE_INCLUDE_PATH);
        $data =
            [
                [
                    'identifier' => 'forgot-password',
                    'subject'    => 'Forgot Password Confirmation',
                    'body'       => $forgot_password_template,
                    'wildcard'   => '[USERNAME],[LINK],[YEAR],[APP_NAME]',
                    'created_at' => Carbon::now()
                ],
                [
                    'identifier' => 'user_registration',
                    'subject'    => 'Welcome to [APP_NAME]',
                    'body'       => $user_register_template,
                    'wildcard'   => '[USERNAME],[LINK],[YEAR],[APP_NAME]',
                    'created_at' => Carbon::now()
                ]
            ];
        \DB::table('mail_templates')->insert($data);
    }

    public function cms_widget()
    {
        \DB::table('cms_widgets')
            ->insert([
                [
                    'title'            => 'Total User',
                    'slug'              => time(). uniqid(),
                    'description'      => NULL,
                    'icon'             => 'icon-user',
                    'color'            => '#4b71fa',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select count(*) from users limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Total Earnings',
                    'slug'              => time(). uniqid(),
                    'description' => NULL,
                    'icon'        => 'icon-people',
                    'color'            => '#7bcb4d',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select COALESCE(sum(admin_tax),0) from user_transactions limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Pending Booking',
                    'slug'              => time(). uniqid(),
                    'description' => NULL,
                    'icon'        => 'icon-user',
                    'color'            => '#4b71fa',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => "Select count(*) from bookings where booking_status='pending' limit 1",
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Inprogress Booking',
                    'slug'              => time(). uniqid(),
                    'description' => NULL,
                    'icon'        => 'icon-people',
                    'color'            => '#7bcb4d ',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              =>"Select count(*) from bookings where booking_status='inprogress' limit 1",
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Completed Booking',
                    'slug'              => time(). uniqid(),
                    'description' => NULL,
                    'icon'        => 'icon-user',
                    'color'            => '#fff',
                    'div_column_class' => 'col-md-12',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'line_chart',
                    'sql'              => "Select count(*) from bookings where booking_status='completed' limit 1",
                    'config'           => NULL,
                ]
            ]);

    }

    public function setPermissions(){
        $user = \DB::table('users')
        ->select('users.id as user_id','user_group_id')
        ->join('user_groups','users.user_group_id','=','user_groups.id')
        ->where('user_groups.title','Admin')
        ->where('user_groups.is_super_admin','0')
        ->first();
        $modules=\DB::table('cms_modules')
        ->where('status','=','1')
        ->get();
        $restrict_modules=['cms-roles-management.index','cms-users-management.index'];
        $permissionData=[];
        foreach ($modules as $key => $module) {
            if(!in_array($module->route_name,$restrict_modules)){
                $permissionData[]=[
                    'user_id'=>$user->user_id,
                    'user_group_id'=>$user->user_group_id,
                    'cms_module_id'=>$module->id,
                    'is_add'=>'1',
                    'is_view'=>'1',
                    'is_update'=>'1',
                    'is_delete'=>'1',
                    'created_at'=>Carbon::now(),        
                ];
            }

            
        }
        \DB::table('cms_module_permissions')->insert($permissionData);
        
        $widgets=\DB::table('cms_widgets')
        ->get();
        $widgets_persmissions=[];
        foreach($widgets as $widget){
             $widgets_persmissions[]=[
                'user_id'=>$user->user_id,
                'user_group_id'=>$user->user_group_id,
                'cms_widget_id'=>$widget->id,
                'created_at'=>Carbon::now(),        
            ];

        }
        \DB::table('cms_widget_role')->insert($widgets_persmissions);


    }
}
