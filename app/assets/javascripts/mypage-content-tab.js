// .mypage-content__tab-container-notification-todo
$(function(){
  $('.tab-content ul[id != "mypage-tab-notification"]').hide();
  $(".mypage-content__tab-container-notification-todo a").click(function(){
    $(".tab-content ul").hide();
    $($(this).attr("href")).show();
    $(".active").removeClass("active");
    $(this).parents().addClass("active");
    return false;
  });
});

// .mypage-content__mypage-tab-container
$(function(){
  $('.mypage-content__tab-content ul[id != "mypage-tab-transaction-now"]').hide();
  $(".mypage-content__mypage-tab-container a").click(function(){
    $(".mypage-content__tab-content ul").hide();
    $($(this).attr("href")).show();
    $(".current").removeClass("current");
    $(this).parents().addClass("current");
    return false;
  });
});