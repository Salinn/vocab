require 'rails_helper'

RSpec.describe "Sentences", type: :request do
  describe "GET /sentences" do
    it "works! (now write some real specs)" do
      get sentences_path
      expect(response).to have_http_status(200)
    end
  end
end
