@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-md-12">
            @include('admin.flash-message')

            @foreach($record->images as $media)
                                    <img src="{{ url('storage/'.$media->file_url) }}" alt="" height="320px" width="320px">
                                    @endforeach                    
            </div>
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header card-default">
                    Dispute Detail
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{route('dispute.update',['dispute'=>$record->slug])}}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="PUT">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Requsted By</label>
                                        <input type="text"  value="{{ $record->user->name }}"  class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Dispute Type</label>
                                        <input  value="{{ $record->module }}" class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    @if($record->module=='bookings')
                                        <label>Booking ID</label>
                                        @else
                                        <label>Sell ID</label>
                                        @endif
                                        <input  value="{{ $record->module_id }}" class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Amount </label>
                                        @if($record->module=='bookings')
                                           <input type="text" value="{{$record->booking->total_charges}}" class="form-control" disabled>
                                         @else
                                            <input type="text"  value="{{$record->sell->total_charges}}" class="form-control" disabled>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Request Status</label>
                                        <select name="dispute_status" id="" class="form-control">
                                            <option value="pending" @if($record->dispute_status=='pending') selected @endif>Pending</option>
                                            <option value="progress" @if($record->dispute_status=='progress') selected @endif>Progress</option>
                                            <option value="declined" @if($record->dispute_status=='declined') selected @endif>Declined</option>
                                            <option value="disputed" @if($record->dispute_status=='disputed') selected @endif>Disputed</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Dispute Status</label>
                                        <select name="admin_status" id="" class="form-control" @if($record->dispute_status=='pending') disabled @endif >
                                            <option value="pending" @if($record->admin_status=='pending') selected @endif>Pending</option>
                                            <option value="resolved" @if($record->admin_status=='resolved') selected @endif>Resolved</option>
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Product</label>
                                        @if($record->module=='bookings')
                                        <input type="text" value="{{ $record->booking->product->name}}" class="form-control" disabled>
                                        @else
                                        <input type="text"  value="{{ $record->sell->product->name}}" class="form-control" disabled>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Dispute Against</label>
                                        @if($record->module=='bookings')
                                        <input  value="{{ $record->booking->owner->name}}" class="form-control" disabled>
                                        @else
                                        <input  value="{{ $record->sell->owner->name}}" class="form-control" disabled>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea  id="" cols="30" rows="10" disabled>{{$record->description}}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12 reason" @if($record->declined_dispute_reason=='')style="display:none;" @endif>
                                    <div class="form-group">
                                        <label>dispute Or decline reason</label>
                                        <textarea name="declined_dispute_reason" id="" cols="30" rows="10" >{{$record->declined_dispute_reason}}</textarea>
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
    @push('scripts')
    <script>
        $(document).ready(function(){
            $("[name='dispute_status']").change(function(){
                if($(this).val()=='declined' || $(this).val()=='disputed' ){
                    $(".reason").show();
                    $("[name='declined_dispute_reason']").prop('required',true);
                }else{
                    $(".reason").hide();
                    $("[name='declined_dispute_reason']").prop('required',false);

                }
            })
        })
        </script>
      
    @endpush
@endsection
