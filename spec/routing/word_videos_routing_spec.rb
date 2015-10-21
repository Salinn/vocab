require "rails_helper"

RSpec.describe WordVideosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/word_videos").to route_to("word_videos#index")
    end

    it "routes to #new" do
      expect(:get => "/word_videos/new").to route_to("word_videos#new")
    end

    it "routes to #show" do
      expect(:get => "/word_videos/1").to route_to("word_videos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/word_videos/1/edit").to route_to("word_videos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/word_videos").to route_to("word_videos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/word_videos/1").to route_to("word_videos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/word_videos/1").to route_to("word_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/word_videos/1").to route_to("word_videos#destroy", :id => "1")
    end

  end
end
