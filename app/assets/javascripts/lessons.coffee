# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#lesson_lesson_start_time').datepicker(dateFormat: 'dd-mm-yy');
  $('#lesson_lesson_end_date').datepicker(dateFormat: 'dd-mm-yy');