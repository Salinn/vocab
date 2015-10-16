require 'rails_helper'

RSpec.describe "word_roots/edit", type: :view do
  before(:each) do
    @word_root = assign(:word_root, WordRoot.create!(
      :root_name => "MyString",
      :root_definition => "MyString"
    ))
  end

  it "renders the edit word_root form" do
    render

    assert_select "form[action=?][method=?]", word_root_path(@word_root), "post" do

      assert_select "input#word_root_root_name[name=?]", "word_root[root_name]"

      assert_select "input#word_root_root_definition[name=?]", "word_root[root_definition]"
    end
  end
end
