require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :class_name => "Class Name"
      ),
      Course.create!(
        :class_name => "Class Name"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Class Name".to_s, :count => 2
  end
end
