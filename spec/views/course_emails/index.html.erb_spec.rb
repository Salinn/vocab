require 'rails_helper'

RSpec.describe "course_emails/index", type: :view do
  before(:each) do
    assign(:course_emails, [
      CourseEmail.create!(
        :course => nil,
        :title => "Title",
        :content => "MyText is long"
      ),
      CourseEmail.create!(
        :course => nil,
        :title => "Title",
        :content => "MyText is long"
      )
    ])
  end

  it "renders a list of course_emails" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText is long".to_s, :count => 2
  end
end
