require 'rails_helper'

RSpec.describe "lesson_modules/show", type: :view do
  let (:question){ FactoryGirl.create(:question) }
  before(:each) do
    @lesson_module = assign(:lesson_module, LessonModule.create!(
                                              name: 'Definition',
                                              attempts: 3,
                                              in_use: true,
                                              value_percentage: 30,
                                              lesson: question.lesson_module.lesson
    ))
    @lesson_module.questions << question
    @lesson = @lesson_module.lesson
    @course = @lesson_module.lesson.course
    @question = question

    allow(view).to receive(:user_signed_in?) { true }
    allow(view).to receive(:current_user) { FactoryGirl.build(:user) }

    allow(view).to receive(:current_page?).with(
        controller: 'lesson_modules',
        action: 'show'
    ).and_return(true)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Definition/)
  end
end
