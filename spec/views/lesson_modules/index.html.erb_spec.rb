require 'rails_helper'

RSpec.describe "lesson_modules/index", type: :view do
  before(:each) do
    assign(:lesson_modules, [
      LessonModule.create!(
        :name => "Name",
        :attempts => 1,
        :lesson => nil,
        :in_use => false,
        :value_percentage => 2
      ),
      LessonModule.create!(
        :name => "Name",
        :attempts => 1,
        :lesson => nil,
        :in_use => false,
        :value_percentage => 2
      )
    ])
  end

  it "renders a list of lesson_modules" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
