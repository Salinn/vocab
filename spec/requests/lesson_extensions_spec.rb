require 'rails_helper'

RSpec.describe "LessonExtensions", type: :request do
  describe "GET /lesson_extensions" do
    it "works! (now write some real specs)" do
      get course_lesson_lesson_extensions_path(course_id: '1', lesson_id: '1')
      expect(response).to have_http_status(200)
    end
  end
end
