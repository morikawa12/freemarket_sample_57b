$( document ).on('turbolinks:load', function() {

  $('#reveal_password').change(function() {

    var check = $('#reveal_password:checked').val();
    var form = $('#signup-form-field').val();
    if (check) {
      
      $('.signup-form__group-checbox__result').addClass('active');
      if (form !=''){
        $('.signup-form__group-checbox__result').text(form)
      }
      $('#signup-form-field').keyup(function(){
        var val = $(this).val();
        $('.signup-form__group-checbox__result.active').text(val);
        })
      }
     else {
      $('.signup-form__group-checbox__result').removeClass('active');
      $('.signup-form__group-checbox__result').text("")
     }
    })
});
