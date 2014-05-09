$(document).ready(function(){
  $('a[href^="#"]').on('click',function (e) {
      e.preventDefault();
  
      var target = this.hash,
      $target = $(target);
  
      $('html, body').stop().animate({
          'scrollTop': $target.offset()
      }, 900, 'easeInOutExpo', function () {
          window.location.hash = target;
      });
  });
});