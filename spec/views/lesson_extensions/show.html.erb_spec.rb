require 'rails_helper'

RSpec.describe "lesson_extensions/show", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  before(:each) do
    @lesson_extension = assign(:lesson_extension, LessonExtension.create!(
      :lesson_id => lesson.id,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/lesson/)
    expect(rendered).to match(//)
  end
end
