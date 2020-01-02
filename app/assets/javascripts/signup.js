$( document ).on('turbolinks:load', function() {

  $('#reveal_password').change(function() {

    var check = $('#reveal_password:checked').val();
    if (check) {
      $('.signup-form__group-checbox__result').addClass('active');
      $('#signup-form-field').keyup(function(){
        var val = $(this).val();
        $('.signup-form__group-checbox__result.active').text(val);
        })
      }
     else {
      $('.signup-form__group-checbox__result').toggle("");
     }
    })
});
