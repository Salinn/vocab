require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/events").to route_to("events#index", course_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/events/new").to route_to("events#new", course_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/events/1").to route_to("events#show", :id => "1", course_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/events/1/edit").to route_to("events#edit", :id => "1", course_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/events").to route_to("events#create", course_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/events/1").to route_to("events#update", :id => "1", course_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/events/1").to route_to("events#update", :id => "1", course_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/events/1").to route_to("events#destroy", :id => "1", course_id: '1')
    end

  end
end
