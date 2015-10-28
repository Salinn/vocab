require "rails_helper"

RSpec.describe WordFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/word_forms").to route_to("word_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/word_forms/new").to route_to("word_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/word_forms/1").to route_to("word_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/word_forms/1/edit").to route_to("word_forms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/word_forms").to route_to("word_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/word_forms/1").to route_to("word_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/word_forms/1").to route_to("word_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/word_forms/1").to route_to("word_forms#destroy", :id => "1")
    end

  end
end
