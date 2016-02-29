require "rails_helper"

RSpec.describe LessonWordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/1/lessons/1/lesson_words").to route_to("lesson_words#index", course_id: '1', lesson_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/courses/1/lessons/1/lesson_words/new").to route_to("lesson_words#new", course_id: '1', lesson_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/courses/1/lessons/1/lesson_words/1").to route_to("lesson_words#show", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/lessons/1/lesson_words/1/edit").to route_to("lesson_words#edit", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/courses/1/lessons/1/lesson_words").to route_to("lesson_words#create", course_id: '1', lesson_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/courses/1/lessons/1/lesson_words/1").to route_to("lesson_words#update", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses/1/lessons/1/lesson_words/1").to route_to("lesson_words#update", :id => "1", course_id: '1', lesson_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1/lessons/1/lesson_words/1").to route_to("lesson_words#destroy", :id => "1", course_id: '1', lesson_id: '1')
    end
  end
end
