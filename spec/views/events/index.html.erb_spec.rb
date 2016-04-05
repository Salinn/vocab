require 'rails_helper'

RSpec.describe "events/index", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  let(:user) { FactoryGirl.create(:user) }
  let(:current_user) { user }

  before(:each) do
    assign(:events, [
      Event.create!(
        title: "Event",
        description: "Event Description",
        start_time: DateTime.now,
        end_time: DateTime.now + 3.hours,
        lesson: lesson
      ),
      Event.create!(
          title: "Event",
          description: "Event Description",
          start_time: DateTime.now,
          end_time: DateTime.now + 3.hours,
          lesson: lesson
      )
    ])
    @course = lesson.course
    sign_in(user)
  end

  it "renders a list of events" do
    render
    #assert_select "tr>td", :text => "Event".to_s, :count => 2
    #assert_select "tr>td", :text => "Event Description".to_s, :count => 2
  end
end
