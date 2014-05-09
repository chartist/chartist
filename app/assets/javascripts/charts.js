function handleDownloadButtonClick() {
  $('#download-btn1').on('click', function(event) {
    var canvas, svg;
    if (!$(this).attr('download')) {
      event.preventDefault();
      svg = $('svg').parent().html();
      canvas = document.getElementById("canvas");
      canvg(canvas, svg);
      $(this).attr('href', Canvas2Image.saveAsPNG(canvas));
      $(this).attr('download', $(this).data('filename'));
      return $(this)[0].click();
    }
    else {
      console.log('hi')
    }
  });
}

$(document).ready(function(){
  $(".alert").alert();
  $('.my-tooltip').tooltip();
  $('.dashboards').tooltip({'trigger':'focus', 'title': 'Add your chart to public boards to collate it with other charts on similar topic'});

  $('#collapseTwo').on('show.bs.collapse', function () {
    $('#first-next').hide();
})
  $('#collapseTwo').on('hide.bs.collapse', function () {
    $('#first-next').show();
})
  //jQuery time
  var current_fs, next_fs, previous_fs; //fieldsets
  var left, opacity, scale; //fieldset properties which we will animate
  var animating; //flag to prevent quick multi-click glitches
  
  handleDownloadButtonClick();

  $(".next").click(function(){
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).closest('fieldset');
    next_fs = $(this).closest('fieldset').next();
    
    //activate next step on progressbar using the index of next_fs
    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    
    //show the next fieldset
    next_fs.show(); 
    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
        //as the opacity of current_fs reduces to 0 - stored in "now"
        //1. scale current_fs down to 80%
        scale = 1 - (1 - now) * 0.2;
        //2. bring next_fs from the right(50%)
        left = (now * 50)+"%";
        //3. increase opacity of next_fs to 1 as it moves in
        opacity = 1 - now;
        current_fs.css({'transform': 'scale('+scale+')'});
        next_fs.css({'left': left, 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
        current_fs.hide();
        animating = false;
      }, 
      //this comes from the custom easing plugin
      easing: 'easeInOutBack'
    });
  });

  $(".previous").click(function(){
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();
    
    //de-activate current step on progressbar
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
    
    //show the previous fieldset
    previous_fs.show(); 
    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
        //as the opacity of current_fs reduces to 0 - stored in "now"
        //1. scale previous_fs from 80% to 100%
        scale = 0.8 + (1 - now) * 0.2;
        //2. take current_fs to the right(50%) - from 0%
        left = ((1-now) * 50)+"%";
        //3. increase opacity of previous_fs to 1 as it moves in
        opacity = 1 - now;
        current_fs.css({'left': left});
        previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
        current_fs.hide();
        animating = false;
      }, 
      //this comes from the custom easing plugin
      easing: 'easeInOutBack'
    });
  });

  $(".submit").click(function(){
    return false;
  })
});

// zeroclipboard rails

$(document).ready(function() {
    var clip = new ZeroClipboard($("#d_clip_button"));
    clip.on('load', function(){
     
      clip.on('complete', function(){
        alert('Copied to clipboard');
      })
    });

    // magnific pop up
    $('.popup-link').magnificPopup({ 
      type: 'iframe'
    });

    // bootsrap popover
    $('#chart_container').popover
  });






