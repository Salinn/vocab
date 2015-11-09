require 'rails_helper'

RSpec.describe "course_emails/show", type: :view do
  before(:each) do
    @course_email = assign(:course_email, CourseEmail.create!(
      :course => nil,
      :title => "Title",
      :content => "MyText is long"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText is long/)
  end
end
