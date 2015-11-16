require 'rails_helper'

RSpec.describe "word_roots/index", type: :view do
  before(:each) do
    assign(:word_roots, [
      WordRoot.create!(
        :root_name => "Root Name",
        :root_definition => "MyText"
      ),
      WordRoot.create!(
        :root_name => "Root Name",
        :root_definition => "MyText"
      )
    ])
    @search = WordRoot.ransack(params[:q])
  end

  it "renders a list of word_roots" do
    render
    assert_select "tr>td", :text => "Root Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
