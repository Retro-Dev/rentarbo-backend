@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                        Page Title
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('category.update',[ 'category' => $record->slug ]) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="PUT">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" required value="{{ $record->name }}" name="name" class="form-control">
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

                                        <option value="1" @if($record->status==1) selected @endif>Active</option>
                                        <option value="0" @if($record->status==0) selected @endif>Disable</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" id="" cols="30" rows="10" class="form-control"> {{$record->description}}</textarea>
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
