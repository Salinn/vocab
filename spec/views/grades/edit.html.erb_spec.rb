require 'rails_helper'

RSpec.describe "grades/edit", type: :view do
  before(:each) do
    @grade = assign(:grade, Grade.create!(
      :user => nil,
      :grade => 1,
      :course => nil,
      :lesson => nil,
      :lesson_module => nil
    ))
  end

  it "renders the edit grade form" do
    render

    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do

      assert_select "input#grade_user_id[name=?]", "grade[user_id]"

      assert_select "input#grade_grade[name=?]", "grade[grade]"

      assert_select "input#grade_course_id[name=?]", "grade[course_id]"

      assert_select "input#grade_lesson_id[name=?]", "grade[lesson_id]"

      assert_select "input#grade_lesson_module_id[name=?]", "grade[lesson_module_id]"
    end
  end
end
