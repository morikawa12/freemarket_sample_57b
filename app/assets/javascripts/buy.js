$( document ).on('turbolinks:load', function() {
  $('.buy_accordion_table__check input').on('click',function(){
    $(this).parent().parent().next('ul').slideToggle();
    $('.point_radio_button').trigger('click');
  });

});