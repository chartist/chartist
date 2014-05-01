# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
   $('#download-btn').on 'click', (event) ->

    unless $(this).attr('download')
      event.preventDefault()

      svg = $('svg').parent().html()
      canvas = document.getElementById("canvas")
      canvg(canvas, svg)

      $(this).attr('href', Canvas2Image.saveAsPNG(canvas));
      $(this).attr('download', $(this).data('filename'));
      $(this)[0].click();