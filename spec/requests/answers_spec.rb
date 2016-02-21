require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "GET /answers" do
    it "works! (now write some real specs)" do
      get course_lesson_lesson_module_question_answers_path(course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
      expect(response).to have_http_status(200)
    end
  end
end
