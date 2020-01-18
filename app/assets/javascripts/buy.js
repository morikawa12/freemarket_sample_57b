$( document ).on('turbolinks:load', function() {
  $('.buy-accordion-table__check input').on('click',function(){
    $(this).parent().parent().next('ul').slideToggle();
    $('.point-radio-button').trigger('click');
  });
});