require 'rails_helper'

RSpec.describe "lesson_modules/index", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:lesson) { FactoryGirl.create(:lesson) }
  let(:user) { FactoryGirl.create(:user) }
  let(:current_user) { user }

  before(:each) do
    @lesson_modules = assign(:lesson_modules, [
      FactoryGirl.create(:lesson_module),FactoryGirl.create(:lesson_module)
    ])
    @course = course
    @lesson = lesson
    sign_in(user)
  end
end
