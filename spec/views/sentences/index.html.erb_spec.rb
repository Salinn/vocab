require 'rails_helper'

RSpec.describe "sentences/index", type: :view do
  before(:each) do
    assign(:sentences, [
      Sentence.create!(
        :word_sentence => "Word Sentence",
        :word => nil
      ),
      Sentence.create!(
        :word_sentence => "Word Sentence",
        :word => nil
      )
    ])
  end

  it "renders a list of sentences" do
    render
    assert_select "tr>td", :text => "Word Sentence".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
