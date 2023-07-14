<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <title>FAQs</title>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Theme style -->
    <link href="{{asset('vendor/crudbooster/assets/adminlte/dist/css/AdminLTE.min.css')}}" rel="stylesheet"
          type="text/css">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>.faq-sec {
    padding: 100px 0;
}

.faq-sec h1 {
    font-size: 40px;
    padding-bottom: 40px;
    color: #008080;
}


.faq-sec .accordion-item {
    border: 0;
    /* background-color: #f7f7fa; */
}

.faq-sec .accordion-item .accordion-button:not(.collapsed) {
    color: #0c63e4;
    background-color: #f7f7fa !important;
    box-shadow: none;
}

.faq-sec .accordion-button.collapsed::after {
    flex-shrink: 0;
    width: 1.25rem;
    height: 1.25rem;
    margin-left: auto;
    content: "";
    background-image: url(../img/addition-icon.png);
    background-repeat: no-repeat;
    background-size: 1.25rem;
    transition: transform .2s ease-in-out;
}

.accordion-button:not(.collapsed)::after {
    background-image: url(../img/subtractuin-icon.png);
    transform: rotate(-180deg);
}

.faq-sec .accordion-item .accordion-button {
    color: #454f63 !important;
    font-size: 20px;
    margin-bottom: 20px !important;
}

.faq-sec .accordion-item .accordion-button:focus {
    border: 0;
    border-color: transparent;
    box-shadow: none;
    z-index: 1;
}

.accordion-button {
    background-color: #f7f7fa !important;
    border-radius: 24px !important;
    margin-bottom: 30px !important;
}

.accordion-body,
.accordion-button {
    padding: 10px 30px;
    margin-bottom: 30px;

}

.faq-sec .your-post-btn {
    margin-top: 90px !important;
}</style>

</head>
<body>
<div class="container-fluid">
    <div class="row">
     <div class="col-sm-12 col-lg-12 col-md-12 faq-sec" style="text-align: justify;">
                <h1>FAQ</h1>
                @foreach($data as $faq)
                <div class="accordion" id="{{$faq->id}}">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                               {{$faq->question}}
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                            data-bs-parent="#{{$faq->id}}">
                            <div class="accordion-body">
                                <p>
                               {{$faq->answer}}
                                    
                                </p>
                            </div>
                        </div>
                    </div>
                    
                   
                   
                </div>
                @endforeach
               
  
     </div>
 </div>
</div>
</body>
</html>
