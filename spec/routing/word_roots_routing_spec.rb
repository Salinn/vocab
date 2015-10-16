require "rails_helper"

RSpec.describe WordRootsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/word_roots").to route_to("word_roots#index")
    end

    it "routes to #new" do
      expect(:get => "/word_roots/new").to route_to("word_roots#new")
    end

    it "routes to #show" do
      expect(:get => "/word_roots/1").to route_to("word_roots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/word_roots/1/edit").to route_to("word_roots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/word_roots").to route_to("word_roots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/word_roots/1").to route_to("word_roots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/word_roots/1").to route_to("word_roots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/word_roots/1").to route_to("word_roots#destroy", :id => "1")
    end

  end
end
