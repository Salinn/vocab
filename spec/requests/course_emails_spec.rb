require 'rails_helper'

RSpec.describe "CourseEmails", type: :request do
  describe "GET /course_emails" do
    it "works! (now write some real specs)" do
      get course_emails_path
      expect(response).to have_http_status(200)
    end
  end
end
