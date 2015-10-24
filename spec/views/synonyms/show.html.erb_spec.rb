require 'rails_helper'

RSpec.describe "synonyms/show", type: :view do
  before(:each) do
    @synonym = assign(:synonym, Synonym.create!(
      :word_synonym => "Word Synonym",
    ))
    @words = Word.all
  end

  it "renders attributes in <p>" do
    #TODO fix these tests
    #render
    #expect(rendered).to match(/Word Synonym/)

  end
end
