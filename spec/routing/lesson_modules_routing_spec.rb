require "rails_helper"

RSpec.describe LessonModulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/lessons/1/lesson_modules").to route_to("lesson_modules#index", course_id: '1', lesson_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/new").to route_to("lesson_modules#new", course_id: '1', lesson_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1").to route_to("lesson_modules#show", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/edit").to route_to("lesson_modules#edit", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/lessons/1/lesson_modules").to route_to("lesson_modules#create", course_id: '1', lesson_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/lessons/1/lesson_modules/1").to route_to("lesson_modules#update", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/lessons/1/lesson_modules/1").to route_to("lesson_modules#update", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/lessons/1/lesson_modules/1").to route_to("lesson_modules#destroy", :id => "1", course_id: '1', lesson_id: '1')
    end

  end
end
