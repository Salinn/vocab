require 'rails_helper'

RSpec.describe LessonWordSentencesController, type: :controller do

  describe "GET #lesson_word:belongs_to" do
    it "returns http success" do
      get :lesson_word:belongs_to
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sentence:belongs_to" do
    it "returns http success" do
      get :sentence:belongs_to
      expect(response).to have_http_status(:success)
    end
  end

end
