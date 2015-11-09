require 'rails_helper'

RSpec.describe "lesson_modules/new", type: :view do
  let(:lesson) { FactoryGirl.create(:lesson) }
  before(:each) do
    assign(:lesson_module, LessonModule.new(
                             name: 'Definition',
                             attempts: 3,
                             lesson_id: lesson.id,
                             in_use: true,
                             value_percentage: 30
                         ))
  end

  it "renders new lesson_module form" do
    render

    assert_select "form[action=?][method=?]", lesson_modules_path, "post" do

      assert_select "input#lesson_module_name[name=?]", "lesson_module[name]"

      assert_select "input#lesson_module_attempts[name=?]", "lesson_module[attempts]"

      assert_select "input#lesson_module_in_use[name=?]", "lesson_module[in_use]"

      assert_select "input#lesson_module_value_percentage[name=?]", "lesson_module[value_percentage]"
    end
  end
end
