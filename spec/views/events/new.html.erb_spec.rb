require 'rails_helper'

RSpec.describe "events/new", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    assign(:event, Event.new(
      title: "MyString",
      description: "MyText",
      lesson: lesson
    ))
    @course = lesson.course
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", course_events_path(course_id: @course.id), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_description[name=?]", "event[description]"
    end
  end
end
