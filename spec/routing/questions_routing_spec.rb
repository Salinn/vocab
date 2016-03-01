require "rails_helper"

RSpec.describe QuestionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions").to route_to("questions#index", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/new").to route_to("questions#new", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1").to route_to("questions#show", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1/edit").to route_to("questions#edit", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/lessons/1/lesson_modules/1/questions").to route_to("questions#create", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/lessons/1/lesson_modules/1/questions/1").to route_to("questions#update", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/lessons/1/lesson_modules/1/questions/1").to route_to("questions#update", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/lessons/1/lesson_modules/1/questions/1").to route_to("questions#destroy", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1')
    end

  end
end
