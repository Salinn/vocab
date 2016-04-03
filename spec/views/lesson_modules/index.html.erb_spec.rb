require 'rails_helper'

RSpec.describe "lesson_modules/index", type: :view do
  let(:course) { FactoryGirl.create(:course) }
  let(:lesson) { FactoryGirl.create(:lesson) }
  before(:each) do
    @lesson_modules = assign(:lesson_modules, [
      FactoryGirl.create(:lesson_module),FactoryGirl.create(:lesson_module)
    ])
    @course = course
    @lesson = lesson
  end
end
