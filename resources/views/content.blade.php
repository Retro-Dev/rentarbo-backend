<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <title> {{ $data->title }}</title>
    <meta charset="utf-8">
    <meta name="robots" content="noindex,nofollow">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title>{{ str_replace('_',' ',env('APP_NAME')) }}</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto-Regular:100,600" rel="stylesheet" type="text/css">
   
    <!-- Bootstrap 3.3.2 -->
    <link href="{{asset('vendor/crudbooster/assets/adminlte/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet"
          type="text/css">
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <!-- Theme style -->
    <link href="{{asset('vendor/crudbooster/assets/adminlte/dist/css/AdminLTE.min.css')}}" rel="stylesheet"
          type="text/css">


</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8 offset-sm-2"><h1>{{$data->title}}:</h1></div>
        <div class="col-sm-12 col-lg-12 col-md-12" style="text-align: justify;">
            {!! $data->content !!}
        </div>
    </div>
</div>
</body>
</html>
