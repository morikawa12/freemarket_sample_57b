$( document ).on('turbolinks:load', function() {

  function readURL1(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev1').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL2(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev2').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL3(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev3').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL4(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev4').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL5(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev5').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function readURL6(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.img_url_prev6').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }



  $('.image-upload-field__delete-btn1').on('click', function(){
    $('.image_upload_btn1').val('');
    $('.image_upload_btn01').val('');
    $('.image-upload-field1').css('display','none');
    $('.exhibition-edit-prev1').css('display','none');
  })

  $('.image-upload-field__delete-btn2').on('click', function(){
    $('.image_upload_btn2').val('');
    $('.image_upload_btn02').val('');
    $('.image-upload-field2').css('display','none');
    $('.exhibition-edit-prev2').css('display','none');
  })

  $('.image-upload-field__delete-btn3').on('click', function(){
    $('.image_upload_btn3').val('');
    $('.image_upload_btn03').val('');
    $('.image-upload-field3').css('display','none');
    $('.exhibition-edit-prev3').css('display','none');
  })

  $('.image-upload-field__delete-btn4').on('click', function(){
    $('.image_upload_btn4').val('');
    $('.image_upload_btn04').val('');
    $('.image-upload-field4').css('display','none');
    $('.exhibition-edit-prev4').css('display','none');
  })

  $('.image-upload-field__delete-btn5').on('click', function(){
    $('.image_upload_btn5').val('');
    $('.image_upload_btn05').val('');
    $('.image-upload-field5').css('display','none');
    $('.exhibition-edit-prev5').css('display','none');
  })

  $('.image-upload-field__delete-btn6').on('click', function(){
    $('.image_upload_btn6').val('');
    $('.image_upload_btn06').val('');
    $('.image-upload-field6').css('display','none');
    $('.exhibition-edit-prev6').css('display','none');
  })


  $(document).on('change','.image_upload_btn1',function(e){
    readURL1(this);
    $('.exhibition-drop-upload-box1').css('display','none');
    $('.image-upload-field1').css('display','block');
    $('.exhibition-drop-upload-box2').css('display','block');
  })
  

  $(document).on('change','.image_upload_btn2',function(e){
    readURL2(this);
    $('.exhibition-drop-upload-box2').css('display','none');
    $('.image-upload-field2').css('display','block');
    $('.exhibition-drop-upload-box3').css('display','block');
  })

  $(document).on('change','.image_upload_btn3',function(e){
    readURL3(this);
    $('.exhibition-drop-upload-box3').css('display','none');
    $('.image-upload-field3').css('display','block');
    $('.exhibition-drop-upload-box4').css('display','block');
  })
  
  $(document).on('change','.image_upload_btn4',function(e){
    readURL4(this);
    $('.exhibition-drop-upload-box4').css('display','none');
    $('.image-upload-field4').css('display','block');
    $('.exhibition-drop-upload-box5').css('display','block');
  })

  $(document).on('change','.image_upload_btn5',function(e){
    readURL5(this);
    $('.exhibition-drop-upload-box').css('display','none');
    $('.image-upload-field5').css('display','block');
  })

  $(document).on('change','.image_upload_btn6',function(e){
    readURL6(this);
    $('.exhibition-drop-upload-box').css('display','none');
    $('.image-upload-field6').css('display','block');
  })


  $(document).on('change','.image_upload_btn01',function(e){
    readURL1(this);
    $('#replace-img-input0').prop("checked", "true")
  })

  $(document).on('change','.image_upload_btn02',function(e){
    readURL2(this);
    $('#replace-img-input1').prop("checked", "true")
  })

  $(document).on('change','.image_upload_btn03',function(e){
    readURL3(this);
    $('#replace-img-input2').prop("checked", "true")
  })

  $(document).on('change','.image_upload_btn04',function(e){
    readURL4(this);
    $('#replace-img-input3').prop("checked", "true")
  })

  $(document).on('change','.image_upload_btn05',function(e){
    readURL5(this);
    $('#replace-img-input4').prop("checked", "true")
  })


  
});