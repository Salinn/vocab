module WordsHelper
  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields pull-right btn btn-success glyphicon glyphicon-plus", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def word_search_associations
    [:word_roots, :word_videos, :sentences, :definitions, :synonyms , :word_forms]
  end
end
