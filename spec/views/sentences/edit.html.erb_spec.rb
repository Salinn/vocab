require 'rails_helper'

RSpec.describe "sentences/edit", type: :view do
  before(:each) do
    @sentence = assign(:sentence, Sentence.create!(
      :word_sentence => "MyString",
      :word => nil
    ))
  end

  it "renders the edit sentence form" do
    render

    assert_select "form[action=?][method=?]", sentence_path(@sentence), "post" do

      assert_select "input#sentence_word_sentence[name=?]", "sentence[word_sentence]"

      assert_select "input#sentence_word_id[name=?]", "sentence[word_id]"
    end
  end
end
