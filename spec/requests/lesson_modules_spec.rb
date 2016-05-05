require 'rails_helper'

RSpec.describe "LessonModules", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /lesson_modules" do
    let (:lesson) { FactoryGirl.create(:lesson)}
    it "works! (now write some real specs)" do
      get course_lesson_lesson_modules_path(lesson_id: lesson.id, course_id: lesson.course.id)
      expect(response).to have_http_status(200)
    end
  end
end
