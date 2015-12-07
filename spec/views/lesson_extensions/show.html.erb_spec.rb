require 'rails_helper'

RSpec.describe "lesson_extensions/show", type: :view do
  before(:each) do
    @lesson_extension = assign(:lesson_extension, LessonExtension.create!(
      :lesson => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
