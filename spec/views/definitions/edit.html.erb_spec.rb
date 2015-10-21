require 'rails_helper'

RSpec.describe "definitions/edit", type: :view do
  before(:each) do
    @definition = assign(:definition, Definition.create!(
      :word_definition => "MyText",
      :word => ""
    ))
  end

  it "renders the edit definition form" do
    render

    assert_select "form[action=?][method=?]", definition_path(@definition), "post" do

      assert_select "textarea#definition_word_definition[name=?]", "definition[word_definition]"

      assert_select "input#definition_belongs_to[name=?]", "definition[belongs_to]"
    end
  end
end
