@extends('admin.auth.master')
@section('content')
    <div class="col-5">
        @include('admin.flash-message')
        @include('admin.auth.header')
        <div class="misc-box">
            <form method="post" action="" role="form">
                {{ csrf_field() }}
                <div class="form-group">
                    <label  for="exampleuser1">Email</label>
                    <div class="group-icon">
                        <input id="exampleuser1" type="email" name="email" placeholder="Email" class="form-control" required="">
                        <span class="icon-user text-muted icon-input"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <div class="group-icon">
                        <input id="exampleInputPassword1" type="password" name="password" placeholder="Password" class="form-control">
                        <span class="icon-lock text-muted icon-input"></span>
                    </div>
                </div>
                <div class="clearfix">
                    <div class="float-right">
                        <button type="submit" class="btn btn-block btn-primary btn-rounded box-shadow">Login</button>
                    </div>
                </div>
                <hr>
                <p class="text-center">
                    <a href="{{ route('admin.forgot-password') }}">Forgot Password?</a>
                </p>
            </form>
        </div>
        @include('admin.auth.footer')
    </div>
@endsection

