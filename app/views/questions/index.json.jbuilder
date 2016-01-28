json.array!(@questions) do |question|
  json.extract! question, :id, :correct_choice, :lesson_module_id, :lesson_word_id
  json.url question_url(question, format: :json)
end
