json.array!(@word_forms) do |word_form|
  json.extract! word_form, :id, :associated_word, :word
  json.url word_form_url(word_form, format: :json)
end
