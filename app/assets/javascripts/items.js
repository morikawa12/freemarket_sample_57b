$(document).on('turbolinks:load', function(){
  $('.slider').not('.slick-initialized').slick({
    autoplay:true,
    autoplaySpeed:4000,
    dots:true,
    dotsClass:'slide-dots'
  });

  $('.footer-mercari-logo').click(function(){
    $('body, html').scrollTop(0);
  });
});