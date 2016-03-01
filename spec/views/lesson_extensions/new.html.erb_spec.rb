require 'rails_helper'

RSpec.describe "lesson_extensions/new", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    assign(:lesson_extension, LessonExtension.new(
      :lesson => nil,
      :user => nil
    ))
    @lesson = lesson
    @course = lesson.course
  end

  it "renders new lesson_extension form" do
    render

    assert_select "form[action=?][method=?]", course_lesson_lesson_extensions_path(course_id: @course.id, lesson_id: @lesson.id), "post" do

      assert_select "input#lesson_extension_lesson_id[name=?]", "lesson_extension[lesson_id]"

      assert_select "input#lesson_extension_user_id[name=?]", "lesson_extension[user_id]"
    end
  end
end
