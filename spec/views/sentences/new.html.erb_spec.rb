require 'rails_helper'

RSpec.describe "sentences/new", type: :view do
  before(:each) do
    assign(:sentence, Sentence.new(
      :word_sentence => "MyString",
      :word => nil
    ))
  end

  it "renders new sentence form" do
    render

    assert_select "form[action=?][method=?]", sentences_path, "post" do

      assert_select "input#sentence_word_sentence[name=?]", "sentence[word_sentence]"

      assert_select "input#sentence_word_id[name=?]", "sentence[word_id]"
    end
  end
end
