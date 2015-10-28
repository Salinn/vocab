require 'rails_helper'

RSpec.describe "Definitions", type: :request do
  describe "GET /definitions" do
    it "works! (now write some real specs)" do
      get definitions_path
      expect(response).to have_http_status(200)
    end
  end
end
