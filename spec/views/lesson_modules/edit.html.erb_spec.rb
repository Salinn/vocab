require 'rails_helper'

RSpec.describe "lesson_modules/edit", type: :view do
  before(:each) do
    @lesson_module = assign(:lesson_module, LessonModule.create!(
      :name => "MyString",
      :attempts => 1,
      :in_use => false,
      :value_percentage => 1
    ))
  end

  it "renders the edit lesson_module form" do
    render

    assert_select "form[action=?][method=?]", lesson_module_path(@lesson_module), "post" do

      assert_select "input#lesson_module_name[name=?]", "lesson_module[name]"

      assert_select "input#lesson_module_attempts[name=?]", "lesson_module[attempts]"

      assert_select "input#lesson_module_in_use[name=?]", "lesson_module[in_use]"

      assert_select "input#lesson_module_value_percentage[name=?]", "lesson_module[value_percentage]"
    end
  end
end
