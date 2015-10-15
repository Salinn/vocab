require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :class_name => "Class Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Class Name/)
  end
end
