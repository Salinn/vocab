require 'rails_helper'

RSpec.describe "word_forms/index", type: :view do
  before(:each) do
    assign(:word_forms, [
      WordForm.create!(
        :associated_word => "Associated Word",
      ),
      WordForm.create!(
        :associated_word => "Associated Word",
      )
    ])
  end

  it "renders a list of word_forms" do
    #TODO fix these tests
    #render
    #assert_select "tr>td", :text => "Associated Word".to_s, :count => 2
  end
end
