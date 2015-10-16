require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :lesson_name => "MyString",
      :lesson_points => 1,
      :course => nil,
      :penalty => 1
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input#lesson_lesson_name[name=?]", "lesson[lesson_name]"

      assert_select "input#lesson_lesson_points[name=?]", "lesson[lesson_points]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"

      assert_select "input#lesson_penalty[name=?]", "lesson[penalty]"
    end
  end
end
