require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "GET /answers" do
    let (:question) { FactoryGirl.create(:question) }

    before do
      # Sign in as a user.
      sign_in_as_a_valid_user
    end

    it "works! (now write some real specs)" do

      get course_lesson_lesson_module_question_answers_path(question_id: question.id, lesson_module_id: question.lesson_module.id, lesson_id: question.lesson_module.lesson.id, course_id: question.lesson_module.lesson.course.id)
      expect(response).to have_http_status(200)
    end
  end
end
