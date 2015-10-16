json.array!(@definitions) do |definition|
  json.extract! definition, :id, :word_definition, :belongs_to
  json.url definition_url(definition, format: :json)
end
