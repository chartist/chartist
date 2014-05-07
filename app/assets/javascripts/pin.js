$(document).ready(function() {
  $('.pin').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).attr('href');
    var name = $(this).text();
    var dashboardUrl  = $(this).data('dashboard-url')
    $.ajax(url, { type: 'PATCH', data: { chart_id: $(this).data('chart-id') }, success: function(){
      $('.dashboard-list').append("<a href=" + dashboardUrl + ">" + name + "</a>");
      $('#pin-btn').click();
    }});
  }); 
});