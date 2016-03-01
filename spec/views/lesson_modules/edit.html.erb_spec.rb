require 'rails_helper'

RSpec.describe "lesson_modules/edit", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:lesson) { FactoryGirl.create(:lesson) }
  before(:each) do
    @lesson_module = assign(:lesson_module, LessonModule.create!(
                                              name: 'Definition',
                                              attempts: 3,
                                              lesson_id: lesson.id,
                                              in_use: true,
                                              value_percentage: 30
    ))
    @course = @lesson_module.lesson.course
    @lesson = @lesson_module.lesson
  end

  it "renders the edit lesson_module form" do
    render

    assert_select "form[action=?][method=?]", course_lesson_lesson_modules_path(course_id: @course.id, lesson_id: @lesson.id), "post" do

      assert_select "input#lesson_module_name[name=?]", "lesson_module[name]"

      assert_select "input#lesson_module_attempts[name=?]", "lesson_module[attempts]"

      assert_select "input#lesson_module_in_use[name=?]", "lesson_module[in_use]"

      assert_select "input#lesson_module_value_percentage[name=?]", "lesson_module[value_percentage]"
    end
  end
end
