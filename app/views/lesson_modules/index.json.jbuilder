json.array!(@lesson_modules) do |lesson_module|
  json.extract! lesson_module, :id, :name, :attempts, :lesson_id, :in_use, :value_percentage
  json.url lesson_module_url(lesson_module, format: :json)
end
