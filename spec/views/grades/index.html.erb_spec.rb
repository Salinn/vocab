require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  before(:each) do
    assign(:grades, [
      Grade.create!(
        :user => nil,
        :grade => 1,
        :course => nil,
        :lesson => nil,
        :lesson_module => nil
      ),
      Grade.create!(
        :user => nil,
        :grade => 1,
        :course => nil,
        :lesson => nil,
        :lesson_module => nil
      )
    ])
  end

  it "renders a list of grades" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
