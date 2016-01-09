require 'rails_helper'

RSpec.describe "Synonyms", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /synonyms" do
    it "works! (now write some real specs)" do
      get synonyms_path
      expect(response).to have_http_status(200)
    end
  end
end
