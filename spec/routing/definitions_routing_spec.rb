require "rails_helper"

RSpec.describe DefinitionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/definitions").to route_to("definitions#index")
    end

    it "routes to #new" do
      expect(:get => "/definitions/new").to route_to("definitions#new")
    end

    it "routes to #show" do
      expect(:get => "/definitions/1").to route_to("definitions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/definitions/1/edit").to route_to("definitions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/definitions").to route_to("definitions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/definitions/1").to route_to("definitions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/definitions/1").to route_to("definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/definitions/1").to route_to("definitions#destroy", :id => "1")
    end

  end
end
