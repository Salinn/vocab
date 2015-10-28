json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :word_sentence, :word_id
  json.url sentence_url(sentence, format: :json)
end
