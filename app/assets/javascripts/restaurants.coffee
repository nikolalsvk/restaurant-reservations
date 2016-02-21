# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#datetimepicker1').datetimepicker(
    format: "YYYY-MM-D HH:mm:ss"
    minDate: new Date()
  )

  $('#datetimepicker1').on 'dp.hide', (ev) ->
    $('#reservation_date').val ev.date._d
    $('#reservation_duration').val $('#duration option:selected').val()
    return
