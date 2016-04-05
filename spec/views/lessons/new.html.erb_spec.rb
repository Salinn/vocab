require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  let (:course) { FactoryGirl.create(:course)}
  before(:each) do
    assign(:lesson, Lesson.new(
      lesson_name: "MyString",
      lesson_points: 1,
      penalty: 1,
      course: course
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", course_lessons_path(course_id: course.id), "post" do

      assert_select "input#lesson_lesson_name[name=?]", "lesson[lesson_name]"

      assert_select "input#lesson_lesson_points[name=?]", "lesson[lesson_points]"
    end
  end
end
