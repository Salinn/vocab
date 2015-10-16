json.array!(@word_roots) do |word_root|
  json.extract! word_root, :id, :root_name, :root_definition
  json.url word_root_url(word_root, format: :json)
end
