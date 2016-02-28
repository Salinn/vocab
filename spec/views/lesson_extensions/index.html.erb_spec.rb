require 'rails_helper'

RSpec.describe "lesson_extensions/index", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    assign(:lesson_extensions, [
      LessonExtension.create!(
        :lesson_id => lesson.id,
        :user => nil,
        extension_date: DateTime.now
      ),
      LessonExtension.create!(
        :lesson_id => lesson.id,
        :user => nil,
        extension_date: DateTime.now
      )
    ])
    @lesson = lesson
    @course = lesson.course
  end

  it "renders a list of lesson_extensions" do
    render
    assert_select "tr>td", :text => lesson.id.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
