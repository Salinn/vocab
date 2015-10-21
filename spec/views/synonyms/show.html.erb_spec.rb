require 'rails_helper'

RSpec.describe "synonyms/show", type: :view do
  before(:each) do
    @synonym = assign(:synonym, Synonym.create!(
      :word_synonym => "Word Synonym",
      :word => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word Synonym/)
    expect(rendered).to match(//)
  end
end
