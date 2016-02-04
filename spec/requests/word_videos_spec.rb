require 'rails_helper'

RSpec.describe "WordVideos", type: :request do
  # Runs before each test.
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user
  end

  describe "GET /word_videos" do
    it "works! (now write some real specs)" do
      get word_videos_path
      expect(response).to have_http_status(200)
    end
  end
end
