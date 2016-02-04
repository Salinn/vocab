require "rails_helper"

RSpec.describe LessonExtensionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lesson_extensions").to route_to("lesson_extensions#index")
    end

    it "routes to #new" do
      expect(:get => "/lesson_extensions/new").to route_to("lesson_extensions#new")
    end

    it "routes to #show" do
      expect(:get => "/lesson_extensions/1").to route_to("lesson_extensions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lesson_extensions/1/edit").to route_to("lesson_extensions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lesson_extensions").to route_to("lesson_extensions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lesson_extensions/1").to route_to("lesson_extensions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lesson_extensions/1").to route_to("lesson_extensions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lesson_extensions/1").to route_to("lesson_extensions#destroy", :id => "1")
    end

  end
end
