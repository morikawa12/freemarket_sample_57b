$( document ).on('turbolinks:load', function() {
  $('.popularity-select-detail').click(function(){
    var i = $('.popularity-select-detail').index(this);
    var p = $('.items-list-block').eq(i)
    var position = $(p).offset().top;
    $("html,body").animate({
      scrollTop : position
    });
  });
});