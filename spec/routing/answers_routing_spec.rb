require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers").to route_to("answers#index", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/new").to route_to("answers#new", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/1").to route_to("answers#show", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/1/edit").to route_to("answers#edit", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers").to route_to("answers#create", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/1").to route_to("answers#update", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/1").to route_to("answers#update", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/lessons/1/lesson_modules/1/questions/1/answers/1").to route_to("answers#destroy", :id => "1", course_id: '1', lesson_id: '1', lesson_module_id: '1', question_id: '1')
    end

  end
end
