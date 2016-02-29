require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    @event = assign(:event, Event.create!(
      title: "Event 1",
      description: "Event1 Description",
      start_time: DateTime.now,
      end_time: DateTime.now + 3.hours,
      lesson: lesson
    ))
    @course = lesson.course
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", course_events_path(course_id: @course.id), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_description[name=?]", "event[description]"
    end
  end
end
