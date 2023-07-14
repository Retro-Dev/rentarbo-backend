<!DOCTYPE html>
<html lang="en">
<head>
  <title>Encrypt Data | AdonisJS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</head>
<body>
  <div class="container">
    <h2>Encrypt</h2>
      <div class="row">
          <div class="col-lg-6">
            <div class="form-group">
              <label for="email">Input Data:</label>
              <textarea rows="10" class="form-control" id="encrypt" placeholder="Enter Data" name="encrypt"></textarea>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <label for="email">Output Data</label>
              <textarea rows="10" readonly class="form-control" id="output" name="output"></textarea>
            </div>
          </div>
      </div>
      <button type="button" class="encrypt_data btn btn-default">Encrypt</button>
  </div>
  <script>
      $('.encrypt_data').click( function(){
          var data = $('#encrypt').val();
          var key = CryptoJS.enc.Utf8.parse(`{{ config('constants.AES_SECRET') }}`);
          var iv =  CryptoJS.enc.Utf8.parse(`{{ config('constants.AES_IV') }}`);
          var ciphertext = CryptoJS.AES.encrypt(data,key,{iv:iv}).toString();
          $('#output').val(ciphertext);
      })

  </script>
</body>
</html>

