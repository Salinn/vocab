require 'rails_helper'

RSpec.describe "LessonExtensions", type: :request do
  describe "GET /lesson_extensions" do
    let (:lesson_extension) { FactoryGirl.create(:lesson_extension)}
    it "works! (now write some real specs)" do
      get course_lesson_lesson_extensions_path(lesson_id: lesson_extension.lesson.id, course_id: lesson_extension.lesson.course.id)
      expect(response).to have_http_status(200)
    end
  end
end
