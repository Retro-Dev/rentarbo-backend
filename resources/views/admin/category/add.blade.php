@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                        Add Category
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{route('category.store')}}" enctype="multipart/form-data" >
                            {{ csrf_field() }}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input required type="text" value="" name="name" class="form-control">
                                    </div>
                                </div>
                                <!-- <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Image</label>
                                        <input  type="file" name="image" class="form-control">
                                    </div>
                                </div> -->
                                <div class="col-md-6">
                                    <div class="form-group"  >
                                        <label>Status</label>
                                        <select name="status" id="status" class="form-control">

                                        <option value="1">Active</option>
                                        <option value="0">De-active</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" id="" cols="30" rows="10" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @include('admin.footer')
    </section>
@endsection
