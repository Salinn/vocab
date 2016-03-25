require 'rails_helper'

RSpec.describe "Grades", type: :request do
  describe "GET /grades" do
    it "works! (now write some real specs)" do
      get grades_path
      expect(response).to have_http_status(200)
    end
  end
end
