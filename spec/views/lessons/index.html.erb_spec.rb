require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: FactoryGirl.create(:course),
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      ),
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: FactoryGirl.create(:course),
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Lesson Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
