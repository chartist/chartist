$(document).ready(function(){  
  $('.btn-file :file').on('change', function() {
    $('.filename').html($(this).val().replace("C:\\fakepath\\", ""));
  });
});