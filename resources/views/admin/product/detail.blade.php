@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                       Ads Detail
                    </div>
                    <div class="card-body">
                        <form method="post" action="" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <div class="row">
                            <div class="col-md-12">
                                    @foreach($record->media as $media)
                                    <img src="{{ url('storage/'.$media->file_url) }}" alt="" height="320px" width="320px">
                                    @endforeach
                               </div>
                                <div class="col-md-6">
                                    <table class="table dataTable no-footer">
                                        <tr><th>Name</th><td>{{$record->name}}</td></tr>
                                        <tr><th>Rent Type</th><td>{{$record->rent_type}}</td></tr>
                                        <tr><th>Rent Charges</th><td>{{$record->rent_charges}}</td></tr>
                                        <tr><th>Sell Price</th><td>{{$record->sell_price}}</td></tr>
                                        <tr><th>Status</th><td>{{$record->status?'Available for booking':'Booked'}}</td></tr>
                                        <tr><th>Admin Approve</th><td>{{$record->is_approve?'Approved':'Pending'}}</td></tr>
                                        <tr><th>Sell Status</th><td>{{$record->sell_status?'Sold':'Not yet'}}</td></tr>
                                        <tr><th>Available for sell</th><td>{{$record->is_sell?'Yes':'No'}}</td></tr>
                                    </table>
                                </div>
                                <div class="col-md-6"> 
                                <table class="table dataTable no-footer">
                                        <tr><th>Category</th><td>{{$record->category->name}}</td></tr>
                                        <tr><th>Facilities</th><td>@foreach(json_decode($record->tags) as $tag)  {{$tag}}@endforeach</td></tr>
                                        <tr><th>Hosting & Demonstration</th><td>{{$record->hosting_demos?'Yes':'No'}}</td></tr>
                                        <tr><th>SSN</th><td>{{$record->ssn}}</td></tr>
                                        <tr><th>Driving Lisense Number</th><td>{{$record->driving_license}}</td></tr>
                                        <tr><th>ID Card Number</th><td>{{$record->id_card}}</td></tr>
                                        <tr><th>Created at</th><td>{{date('Y-m-d',strtotime($record->created_at))}}</td></tr>
                                    </table>
                                </div>
                               <div class="col-md-12">
                                  <table class="table dataTable no-footer">
                                    <tr><th>Description</th><td>{{$record->description}}</td></tr>
                                    <tr><th>Pick-up Location</th><td>{{$record->pick_up_location_address}}</td></tr>
                                    <tr><th>Dorp-off Location</th><td>{{$record->drop_location_address}}</td></tr>
                                  </table>
                               </div>
                             
                            
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @include('admin.footer')
    </section>
@endsection
