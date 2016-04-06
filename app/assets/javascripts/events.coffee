# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $("#calendar").fullCalendar(
    editable: true,
    eventLimit: true,
#    googleCalendarApiKey: teamvocab gmail calendar api key, this will be used to get events from RIT academic calendar
    eventSources:[
      {
        url: jQuery.ajaxSettings.url
      },
      {
#        googleCalendarId: team vocab calendar id
      }
    ]
  )
