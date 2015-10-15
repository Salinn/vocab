json.array!(@courses) do |course|
  json.extract! course, :id, :class_name, :start_date, :end_date
  json.url course_url(course, format: :json)
end
