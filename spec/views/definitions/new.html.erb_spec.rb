require 'rails_helper'

RSpec.describe "definitions/new", type: :view do
  before(:each) do
    assign(:definition, Definition.new(
      :word_definition => "MyText"
    ))
    @words = Word.all
  end

  it "renders new definition form" do
    render

    assert_select "form[action=?][method=?]", definitions_path, "post" do

      assert_select "textarea#definition_word_definition[name=?]", "definition[word_definition]"

    end
  end
end
