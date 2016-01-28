require 'rails_helper'

RSpec.describe "lesson_extensions/new", type: :view do
  before(:each) do
    assign(:lesson_extension, LessonExtension.new(
      :lesson => nil,
      :user => nil
    ))
  end

  it "renders new lesson_extension form" do
    render

    assert_select "form[action=?][method=?]", lesson_extensions_path, "post" do

      assert_select "input#lesson_extension_lesson_id[name=?]", "lesson_extension[lesson_id]"

      assert_select "input#lesson_extension_user_id[name=?]", "lesson_extension[user_id]"
    end
  end
end
