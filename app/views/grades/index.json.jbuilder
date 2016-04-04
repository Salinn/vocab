json.array!(@grades) do |grade|
  json.extract! grade, :id, :user_id, :grade, :course_id, :lesson_id, :lesson_module_id
  json.url grade_url(grade, format: :json)
end
