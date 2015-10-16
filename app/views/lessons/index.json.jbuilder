json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :lesson_name, :lesson_points, :lesson_start_time, :lesson_end_date, :course_id, :penalty
  json.url lesson_url(lesson, format: :json)
end
