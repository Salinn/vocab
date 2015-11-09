require 'rails_helper'

RSpec.describe "lesson_modules/index", type: :view do
  before(:each) do
    lesson_modules = [
        {
            name: "Module 1 Test",
            attempts: 2,
            in_use: true,
            value_percentage: 1
        },
        {
            name: "Module 2 Test",
            attempts: 2,
            in_use: true,
            value_percentage: 1
        },
        {
            name: "Module 3 Test",
            attempts: 2,
            in_use: true,
            value_percentage: 1
        },
        {
            name: "Module 4 Test",
            attempts: 2,
            in_use: true,
            value_percentage: 1
        },
        {
            name: "Module 5 Test",
            attempts: 2,
            in_use: true,
            value_percentage: 1
        }
    ]

    assign(:lesson_modules, [
      LessonModule.create!(
          name: 'Definition',
          attempts: 3,
          in_use: true,
          value_percentage: 30
      ),
      LessonModule.create!(
          name: 'Definition',
          attempts: 3,
          in_use: true,
          value_percentage: 30
      )
    ])
  end

  it "renders a list of lesson_modules" do
    render
    assert_select "tr>td", :text => "Definition".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 30.to_s, :count => 2
  end
end
