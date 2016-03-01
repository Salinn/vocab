require "rails_helper"

RSpec.describe CourseEmailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/course_emails").to route_to("course_emails#index", course_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/course_emails/new").to route_to("course_emails#new", course_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/course_emails/1").to route_to("course_emails#show", :id => "1", course_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/course_emails/1/edit").to route_to("course_emails#edit", :id => "1", course_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/course_emails").to route_to("course_emails#create", course_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/course_emails/1").to route_to("course_emails#update", :id => "1", course_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/course_emails/1").to route_to("course_emails#update", :id => "1", course_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/course_emails/1").to route_to("course_emails#destroy", :id => "1", course_id: '1')
    end

  end
end
