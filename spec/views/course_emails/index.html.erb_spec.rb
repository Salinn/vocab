require 'rails_helper'

RSpec.describe "course_emails/index", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    user.add_role(:teacher, course)
    assign(:course_emails, [
      CourseEmail.create!(
        course_id: course.id,
        :title => "Title",
        :content => "MyText is long"
      ),
      CourseEmail.create!(
        course_id: course.id,
        :title => "Title",
        :content => "MyText is long"
      )
    ])
  end

  it "renders a list of course_emails" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText is long".to_s, :count => 2
  end
end
