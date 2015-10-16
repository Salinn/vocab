json.array!(@definitions) do |definition|
  json.extract! definition, :id, :word_definition, :word
  json.url definition_url(definition, format: :json)
end
