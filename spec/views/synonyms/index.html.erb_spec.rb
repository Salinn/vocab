require 'rails_helper'

RSpec.describe "synonyms/index", type: :view do
  before(:each) do
    assign(:synonyms, [
      Synonym.create!(
        :word_synonym => "Word Synonym",
        :word => nil
      ),
      Synonym.create!(
        :word_synonym => "Word Synonym",
        :word => nil
      )
    ])
  end

  it "renders a list of synonyms" do
    render
    assert_select "tr>td", :text => "Word Synonym".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
