require 'rails_helper'

RSpec.describe "LessonExtensions", type: :request do
  describe "GET /lesson_extensions" do
    it "works! (now write some real specs)" do
      get lesson_extensions_path
      expect(response).to have_http_status(200)
    end
  end
end
