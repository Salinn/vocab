require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      lesson_name: "Lesson Name",
      lesson_points: 15,
      course: FactoryGirl.create(:course),
      penalty: 3,
      lesson_start_time: Date.today,
      lesson_end_date: Date.today + 3.months
    ))
    @course = @lesson.course
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lesson Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
