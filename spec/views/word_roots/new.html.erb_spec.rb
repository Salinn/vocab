require 'rails_helper'

RSpec.describe "word_roots/new", type: :view do
  before(:each) do
    assign(:word_root, WordRoot.new(
      :root_name => "MyString",
      :root_definition => "MyText"
    ))
  end

  it "renders new word_root form" do
    render

    assert_select "form[action=?][method=?]", word_roots_path, "post" do

      assert_select "input#word_root_root_name[name=?]", "word_root[root_name]"

      assert_select "textarea#word_root_root_definition[name=?]", "word_root[root_definition]"
    end
  end
end
