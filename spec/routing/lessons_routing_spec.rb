require "rails_helper"

RSpec.describe LessonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/courses/1/lessons").to route_to("lessons#index", course_id: '1')
    end

    it "routes to #new" do
      expect(get: "/courses/1/lessons/new").to route_to("lessons#new", course_id: '1')
    end

    it "routes to #show" do
      expect(get: "/courses/1/lessons/1").to route_to("lessons#show", id: "1", course_id: '1')
    end

    it "routes to #edit" do
      expect(get: "/courses/1/lessons/1/edit").to route_to("lessons#edit", id: "1", course_id: '1')
    end

    it "routes to #create" do
      expect(post: "/courses/1/lessons").to route_to("lessons#create", course_id: '1')
    end

    it "routes to #update via PUT" do
      expect(put: "/courses/1/lessons/1").to route_to("lessons#update", id: "1", course_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(patch: "/courses/1/lessons/1").to route_to("lessons#update", id: "1", course_id: '1')
    end

    it "routes to #destroy" do
      expect(delete: "/courses/1/lessons/1").to route_to("lessons#destroy", id: "1", course_id: '1')
    end

  end
end
