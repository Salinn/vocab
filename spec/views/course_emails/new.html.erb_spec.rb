require 'rails_helper'

RSpec.describe "course_emails/new", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  before(:each) do
    assign(:course_email, CourseEmail.new(
      course: course,
      title: "MyString",
      content: "MyText is long"
    ))
    @course = course
  end

  it "renders new course_email form" do
    render

    assert_select "form[action=?][method=?]", course_course_emails_path(course_id: course.id), "post" do

      assert_select "input#course_email_course_id[name=?]", "course_email[course_id]"

      assert_select "input#course_email_title[name=?]", "course_email[title]"

      assert_select "textarea#course_email_content[name=?]", "course_email[content]"
    end
  end
end
