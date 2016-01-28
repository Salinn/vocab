json.array!(@lesson_extensions) do |lesson_extension|
  json.extract! lesson_extension, :id, :lesson_id, :user_id, :extension_date
  json.url lesson_extension_url(lesson_extension, format: :json)
end
