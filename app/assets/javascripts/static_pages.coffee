# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#user_user_id', '#admin_remove').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'