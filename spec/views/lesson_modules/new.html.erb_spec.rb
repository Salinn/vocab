require 'rails_helper'

RSpec.describe "lesson_modules/new", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    @course = lesson.course
    @lesson = lesson
    assign(:lesson_module, LessonModule.new(
                             name: 'Testing',
                             attempts: 3,
                             lesson_id: lesson.id,
                             in_use: true,
                             value_percentage: 30
                         ))
  end

  it "renders new lesson_module form" do
    render
    assert_select "form[action=?][method=?]", course_lesson_lesson_modules_path(course_id: @course.id, lesson_id: @lesson.id), "get" do

      assert_select "input#lesson_module_name[name=?]", "lesson_module[name]"

      assert_select "input#lesson_module_attempts[name=?]", "lesson_module[attempts]"

      assert_select "input#lesson_module_in_use[name=?]", "lesson_module[in_use]"

      assert_select "input#lesson_module_value_percentage[name=?]", "lesson_module[value_percentage]"
    end
  end
end
