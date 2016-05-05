json.array!(@events) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_time
  json.end event.end_time
  json.url course_event_url(event, course_id: event.lesson.course.id, format: :html)
end
