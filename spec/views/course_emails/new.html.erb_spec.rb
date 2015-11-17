require 'rails_helper'

RSpec.describe "course_emails/new", type: :view do
  before(:each) do
    assign(:course_email, CourseEmail.new(
      :course => nil,
      :title => "MyString",
      :content => "MyText is long"
    ))
  end

  it "renders new course_email form" do
    render

    assert_select "form[action=?][method=?]", course_emails_path, "post" do

      assert_select "input#course_email_course_id[name=?]", "course_email[course_id]"

      assert_select "input#course_email_title[name=?]", "course_email[title]"

      assert_select "textarea#course_email_content[name=?]", "course_email[content]"
    end
  end
end
