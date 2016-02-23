require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  let(:lesson) {FactoryGirl.create(:lesson_no_call_backs)}
  let(:valid_event_attributes) {
    {
        title: 'Event',
        description: 'Description',
        start_time: DateTime.now,
        end_time: DateTime.now + 2.hours,
        lesson_id: lesson.id
    }
  }


  describe 'Generates Valid Event Link' do
    it "generates a link to one of the events" do
      event = Event.create!(valid_event_attributes)
      expect(events_link(event)).to eql('<a href="/events/' + event.id.to_s + '">Event</a>')
    end
  end
end
