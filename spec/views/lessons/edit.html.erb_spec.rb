require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
                                lesson_name: "Lesson Name",
                                lesson_points: 15,
                                course: FactoryGirl.create(:course),
                                penalty: 3,
                                lesson_start_time: Date.today,
                                lesson_end_date: Date.today + 3.months,
                                lesson_modules: LessonModule.all
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form input" do #TODO look into why this was failing before

      assert_select "input#lesson_lesson_name[name=?]", "lesson[lesson_name]"

      assert_select "input#lesson_lesson_points[name=?]", "lesson[lesson_points]"
    end
  end
end
