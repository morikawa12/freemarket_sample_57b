$( document ).on('turbolinks:load', function() {

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_url_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('change','#item_images_attributes_0_image_url',function(e){
    readURL(this);
    $('.exhibition_drop_upload_box').css('width','80%');
    $('.image_upload_field').css('display','block')
  })
});