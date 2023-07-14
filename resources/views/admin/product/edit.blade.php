@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                    Update Ads
                </div>
                    <div class="card-body">
                        <form method="post" action="{{route('product.update',['product'=>$record->slug])}}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="PUT">
                            <div class="row">
                                <div class="col-md-6">
                                <label>Status</label>

                                    <div class="form-group">
                                        <select name="is_approved" id="" class="form-control" required>
                                            <option value="1" @if($record->is_approved==1) selected @endif>@if($record->is_approved==1)Approved @else Approved @endif</option>
                                            <option value="0" @if($record->is_approved==0) selected @endif>@if($record->is_approved==0)Not Approved @else Disapprove @endif</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                    <label>Booking Status</label>

                                        <select name="status" id="" class="form-control" required disabled>
                                            <option value="1" @if($record->status==1) selected @endif>Available for booking</option>
                                            <option value="0" @if($record->status==0) selected @endif>Booked</option>
                                        </select>
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
