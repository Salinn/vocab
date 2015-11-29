require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Event",
        :description => "Event Description",
        :start_time => DateTime.now,
        :end_time => DateTime.now + 3.hours
      ),
      Event.create!(
        :title => "Event",
        :description => "Event Description",
        :start_time => DateTime.now,
        :end_time => DateTime.now + 3.hours
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Event".to_s, :count => 2
    assert_select "tr>td", :text => "Event Description".to_s, :count => 2
  end
end
