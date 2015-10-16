require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :lesson_name => "MyString",
      :lesson_points => 1,
      :course => nil,
      :penalty => 1
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_lesson_name[name=?]", "lesson[lesson_name]"

      assert_select "input#lesson_lesson_points[name=?]", "lesson[lesson_points]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"

      assert_select "input#lesson_penalty[name=?]", "lesson[penalty]"
    end
  end
end
