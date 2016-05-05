require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /lessons" do
    let (:lesson){ FactoryGirl.create(:lesson) }
    it "works! (now write some real specs)" do
      get course_lessons_path(course_id: lesson.course.id)
      expect(response).to have_http_status(200)
    end
  end
end
