require "rails_helper"

RSpec.describe LessonModulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lesson_modules").to route_to("lesson_modules#index")
    end

    it "routes to #new" do
      expect(:get => "/lesson_modules/new").to route_to("lesson_modules#new")
    end

    it "routes to #show" do
      expect(:get => "/lesson_modules/1").to route_to("lesson_modules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lesson_modules/1/edit").to route_to("lesson_modules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lesson_modules").to route_to("lesson_modules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lesson_modules/1").to route_to("lesson_modules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lesson_modules/1").to route_to("lesson_modules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lesson_modules/1").to route_to("lesson_modules#destroy", :id => "1")
    end

  end
end
