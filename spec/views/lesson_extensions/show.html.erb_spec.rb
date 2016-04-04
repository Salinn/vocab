require 'rails_helper'

RSpec.describe "lesson_extensions/show", type: :view do
  let (:lesson){ FactoryGirl.create(:lesson_no_call_backs) }
  let(:user) { FactoryGirl.create(:user) }
  let(:current_user) { user }

  before(:each) do
    @lesson_extension = assign(:lesson_extension, LessonExtension.create!(
      :lesson_id => lesson.id,
      :user => nil
    ))
    sign_in(user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/lesson/)
    expect(rendered).to match(//)
  end
end
