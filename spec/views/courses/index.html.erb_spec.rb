require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    allow(view).to receive_messages(:current_user => user)
    assign(:courses, [
      Course.create!(
        class_name: "Class Name",
        start_date: Date.today,
        end_date: Date.today + 3.months
      ),
      Course.create!(
        class_name: "Class Name",
        start_date: Date.today,
        end_date: Date.today + 3.months
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Class Name".to_s, :count => 2
  end
end
