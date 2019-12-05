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



  $('.image_upload_field__delete-btn1').on('click', function(){
    $('.image_upload_btn1').val('');
    $('.image_upload_btn01').val('');
    $('.image_upload_field1').css('display','none');
    $('.exhibition_edit_prev1').css('display','none');
  })

  $('.image_upload_field__delete-btn2').on('click', function(){
    $('.image_upload_btn2').val('');
    $('.image_upload_btn02').val('');
    $('.image_upload_field2').css('display','none');
    $('.exhibition_edit_prev2').css('display','none');
  })

  $('.image_upload_field__delete-btn3').on('click', function(){
    $('.image_upload_btn3').val('');
    $('.image_upload_btn03').val('');
    $('.image_upload_field3').css('display','none');
    $('.exhibition_edit_prev3').css('display','none');
  })

  $('.image_upload_field__delete-btn4').on('click', function(){
    $('.image_upload_btn4').val('');
    $('.image_upload_btn04').val('');
    $('.image_upload_field4').css('display','none');
    $('.exhibition_edit_prev4').css('display','none');
  })

  $('.image_upload_field__delete-btn5').on('click', function(){
    $('.image_upload_btn5').val('');
    $('.image_upload_btn05').val('');
    $('.image_upload_field5').css('display','none');
    $('.exhibition_edit_prev5').css('display','none');
  })

  $(document).on('change','.image_upload_btn1',function(e){
    readURL1(this);
    $('.exhibition_drop_upload_box1').css('display','none');
    $('.image_upload_field1').css('display','block');
    $('.exhibition_drop_upload_box2').css('display','block');
  })
  

  $(document).on('change','.image_upload_btn2',function(e){
    readURL2(this);
    $('.exhibition_drop_upload_box2').css('display','none');
    $('.image_upload_field2').css('display','block');
    $('.exhibition_drop_upload_box3').css('display','block');
  })

  $(document).on('change','.image_upload_btn3',function(e){
    readURL3(this);
    $('.exhibition_drop_upload_box3').css('display','none');
    $('.image_upload_field3').css('display','block');
    $('.exhibition_drop_upload_box4').css('display','block');
  })
  
  $(document).on('change','.image_upload_btn4',function(e){
    readURL4(this);
    $('.exhibition_drop_upload_box4').css('display','none');
    $('.image_upload_field4').css('display','block');
    $('.exhibition_drop_upload_box5').css('display','block');
  })

  $(document).on('change','.image_upload_btn5',function(e){
    readURL5(this);
    $('.exhibition_drop_upload_box').css('display','none');
    $('.image_upload_field5').css('display','block');
  })

  $(document).on('change','.image_upload_btn6',function(e){
    readURL6(this);
    $('.exhibition_drop_upload_box').css('display','none');
    $('.image_upload_field6').css('display','block');
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