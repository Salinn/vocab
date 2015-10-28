json.array!(@synonyms) do |synonym|
  json.extract! synonym, :id, :word_synonym, :word_id
  json.url synonym_url(synonym, format: :json)
end
