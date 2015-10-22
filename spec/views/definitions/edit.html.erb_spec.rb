require 'rails_helper'

RSpec.describe "definitions/edit", type: :view do
  before(:each) do
    @definition = assign(:definition, Definition.create!(
      :word_definition => "MyText"
    ))
    @words = Word.all
  end

  it "renders the edit definition form" do
    render

    assert_select "form[action=?][method=?]", definition_path(@definition), "post" do

      assert_select "textarea#definition_word_definition[name=?]", "definition[word_definition]"

    end
  end
end
