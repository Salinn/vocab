require 'rails_helper'

RSpec.describe "course_emails/edit", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    user.add_role(:teacher, course)
    @course_email = assign(:course_email, CourseEmail.create!(
      course_id: course.id,
      :title => "MyString",
      :content => "MyText is long"
    ))
  end

  it "renders the edit course_email form" do
    render

    assert_select "form[action=?][method=?]", course_email_path(@course_email), "post" do

      assert_select "input#course_email_course_id[name=?]", "course_email[course_id]"

      assert_select "input#course_email_title[name=?]", "course_email[title]"

      assert_select "textarea#course_email_content[name=?]", "course_email[content]"
    end
  end
end
