json.array!(@definitions) do |definition|
  json.extract! definition, :id, :word_definition
  json.url definition_url(definition, format: :json)
end
