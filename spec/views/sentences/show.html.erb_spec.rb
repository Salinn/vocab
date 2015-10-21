require 'rails_helper'

RSpec.describe "sentences/show", type: :view do
  before(:each) do
    @sentence = assign(:sentence, Sentence.create!(
      :word_sentence => "Word Sentence"
    ))
  end

  it "renders attributes in <p>" do
    #TODO fix these tests
    #render
    #expect(rendered).to match(/Word Sentence/)

  end
end
