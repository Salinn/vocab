require 'rails_helper'

RSpec.describe "word_roots/index", type: :view do
  before(:each) do
    assign(:word_roots, [
      WordRoot.create!(
        :root_name => "Root Name",
        :root_definition => "Root Definition"
      ),
      WordRoot.create!(
        :root_name => "Root Name",
        :root_definition => "Root Definition"
      )
    ])
  end

  it "renders a list of word_roots" do
    render
    assert_select "tr>td", :text => "Root Name".to_s, :count => 2
    assert_select "tr>td", :text => "Root Definition".to_s, :count => 2
  end
end
