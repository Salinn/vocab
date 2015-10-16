require 'rails_helper'

RSpec.describe "definitions/index", type: :view do
  before(:each) do
    assign(:definitions, [
      Definition.create!(
        :word_definition => "MyText",
        :word => ""
      ),
      Definition.create!(
        :word_definition => "MyText",
        :word => ""
      )
    ])
  end

  it "renders a list of definitions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
