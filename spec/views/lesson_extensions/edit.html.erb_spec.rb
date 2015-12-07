require 'rails_helper'

RSpec.describe "lesson_extensions/edit", type: :view do
  before(:each) do
    @lesson_extension = assign(:lesson_extension, LessonExtension.create!(
      :lesson => nil,
      :user => nil
    ))
  end

  it "renders the edit lesson_extension form" do
    render

    assert_select "form[action=?][method=?]", lesson_extension_path(@lesson_extension), "post" do

      assert_select "input#lesson_extension_lesson_id[name=?]", "lesson_extension[lesson_id]"

      assert_select "input#lesson_extension_user_id[name=?]", "lesson_extension[user_id]"
    end
  end
end
