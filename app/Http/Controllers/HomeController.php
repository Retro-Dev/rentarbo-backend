<?php
namespace App\Http\Controllers;

use App\Models\ContentManagement;
use App\Models\Faq;


class HomeController
{
    public function getContent($slug)
    {
        $data = ContentManagement::getBySlug($slug);
      

        return view('content',['data'=>$data] );
    }
    public function faq()
    {
        $data = Faq::all();
        return view('faq',['data'=>$data] );
    }

}
