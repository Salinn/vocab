json.array!(@words) do |word|
  json.extract! word, :id, :name
  json.url word_url(word, format: :json)
end
