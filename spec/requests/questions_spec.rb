require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    let (:lesson_module) { FactoryGirl.create(:lesson_module)}
    it "works! (now write some real specs)" do
      get course_lesson_lesson_module_questions_path(lesson_module_id: lesson_module.id, lesson_id: lesson_module.lesson.id, course_id: lesson_module.lesson.course.id)
      expect(response).to have_http_status(200)
    end
  end
end
