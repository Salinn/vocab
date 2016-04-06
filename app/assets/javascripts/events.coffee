# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $("#calendar").fullCalendar(
    editable: true,
    eventLimit: true,
#    googleCalendarApiKey: 'AIzaSyAf-RhcmH_Oz8vaQAE4hG5ZZF0kFvfGq4s'
    eventSources: [
      {
        url: jQuery.ajaxSettings.url
      },
      {
#        googleCalendarId: 'mlabwa1@gmail.com'
      }
    ]
  )
