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
      get questions_path
      expect(response).to have_http_status(200)
    end
  end
end
