require 'rails_helper'

RSpec.describe "synonyms/edit", type: :view do
  before(:each) do
    @synonym = assign(:synonym, Synonym.create!(
      :word_synonym => "MyString",
      :word => nil
    ))
  end

  it "renders the edit synonym form" do
    render

    assert_select "form[action=?][method=?]", synonym_path(@synonym), "post" do

      assert_select "input#synonym_word_synonym[name=?]", "synonym[word_synonym]"

      assert_select "input#synonym_word_id[name=?]", "synonym[word_id]"
    end
  end
end
