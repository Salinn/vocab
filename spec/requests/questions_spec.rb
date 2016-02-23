require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let (:question){ FactoryGirl.create(:question) }

  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /questions" do
    it "works! (now write some real specs)" do
      get course_lesson_lesson_module_question_answers_path(course_id: question.lesson_modlue.lesson.course.id, lesson_id: question.lesson_modlue.lesson.id, lesson_module_id: question.lesson_modlue.id, question_id: question.id)
      expect(response).to have_http_status(200)
    end
  end
end
