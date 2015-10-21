require 'rails_helper'

RSpec.describe "sentences/show", type: :view do
  before(:each) do
    @sentence = assign(:sentence, Sentence.create!(
      :word_sentence => "Word Sentence",
      :word => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word Sentence/)
    expect(rendered).to match(//)
  end
end
