json.array!(@synonyms) do |synonym|
  json.extract! synonym, :id, :word_synonym
  json.url synonym_url(synonym, format: :json)
end
