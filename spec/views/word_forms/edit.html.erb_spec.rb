require 'rails_helper'

RSpec.describe "word_forms/edit", type: :view do
  before(:each) do
    @word_form = assign(:word_form, WordForm.create!(
      :associated_word => "MyString",
    ))
    @words = Word.all
  end

  it "renders the edit word_form form" do
    render

    assert_select "form[action=?][method=?]", word_form_path(@word_form), "post" do

      assert_select "input#word_form_associated_word[name=?]", "word_form[associated_word]"

    end
  end
end
