$(document).ready(function() {
  $('.pin').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    url = $(this).attr('href')
    $.ajax(url, { type: 'PATCH', data: { chart_id: $(this).data('chart-id') } });
  }); 
});