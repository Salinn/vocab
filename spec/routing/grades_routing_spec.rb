require "rails_helper"

RSpec.describe GradesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grades").to route_to("grades#index")
    end

    it "routes to #new" do
      expect(:get => "/grades/new").to route_to("grades#new")
    end

    it "routes to #show" do
      expect(:get => "/grades/1").to route_to("grades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grades/1/edit").to route_to("grades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grades").to route_to("grades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grades/1").to route_to("grades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grades/1").to route_to("grades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grades/1").to route_to("grades#destroy", :id => "1")
    end

  end
end
