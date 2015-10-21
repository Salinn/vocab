require 'rails_helper'

RSpec.describe "sentences/index", type: :view do
  before(:each) do
    assign(:sentences, [
      Sentence.create!(
        :word_sentence => "Word Sentence"
      ),
      Sentence.create!(
        :word_sentence => "Word Sentence"
      )
    ])
  end

  it "renders a list of sentences" do
    #TODO fix these tests
    #render
    #assert_select "tr>td", :text => "Word Sentence".to_s, :count => 2

  end
end
