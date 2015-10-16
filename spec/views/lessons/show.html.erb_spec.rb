require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :lesson_name => "Lesson Name",
      :lesson_points => 1,
      :course => nil,
      :penalty => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lesson Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
