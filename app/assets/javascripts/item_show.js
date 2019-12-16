$( document ).on('turbolinks:load', function() {
  $('.image-slide-prev').hover(function(){

    var index = $('.image-slide-prev').index($(this));
    
    $('.image-slide-prev').removeClass('image-opacity');
    $('.image-slide').removeClass('image-active');
    $('.image-slide-prev').eq(index).addClass('image-opacity')
    $('.image-slide').eq(index).addClass('image-active')
  })
});