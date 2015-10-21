require 'rails_helper'

RSpec.describe "synonyms/new", type: :view do
  before(:each) do
    assign(:synonym, Synonym.new(
      :word_synonym => "MyString"
    ))
    @words = Word.all
  end

  it "renders new synonym form" do
    render

    assert_select "form[action=?][method=?]", synonyms_path, "post" do

      assert_select "input#synonym_word_synonym[name=?]", "synonym[word_synonym]"

      #assert_select "input#synonym_word_id[name=?]", "synonym[word_id]"
    end
  end
end
