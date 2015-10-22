require 'rails_helper'

RSpec.describe "definitions/index", type: :view do
  before(:each) do
    assign(:definitions, [
      Definition.create!(
        :word_definition => "MyText"
      ),
      Definition.create!(
        :word_definition => "MyText"
      )
    ])
  end

  it "renders a list of definitions" do
    #TODO fix these tests
    #render
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
