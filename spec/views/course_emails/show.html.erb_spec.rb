require 'rails_helper'

RSpec.describe "course_emails/show", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }
  let(:current_user) { user }

  before(:each) do
    user.add_role(:teacher, course)
    @course_email = assign(:course_email, CourseEmail.create!(
      course_id: course.id,
      :title => "Title",
      :content => "MyText is long"
    ))
    sign_in(user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText is long/)
  end
end
