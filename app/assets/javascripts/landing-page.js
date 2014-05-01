
$(document).ready(function(){


  /* ---- Countdown timer ---- */

  $('#counter').countdown({
    timestamp : new Date("2014-05-09T16:00:00Z")
  });


  /* ---- Animations ---- */

  $('#links a').hover(
    function(){ $(this).animate({ left: 3 }, 'fast'); },
    function(){ $(this).animate({ left: 0 }, 'fast'); }
  );

  $('footer a').hover(
    function(){ $(this).animate({ top: 3 }, 'fast'); },
    function(){ $(this).animate({ top: 0 }, 'fast'); }
  );

});
