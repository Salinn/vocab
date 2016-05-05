require 'rails_helper'
require 'will_paginate/array'

RSpec.describe "lessons/index", type: :view do

  let (:course) { FactoryGirl.create(:course)}
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: course,
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      ),
      Lesson.create!(
          lesson_name: "Lesson Name",
          lesson_points: 15,
          course: course,
          penalty: 3,
          lesson_start_time: Date.today,
          lesson_end_date: Date.today + 3.months
      )
    ])
    @course = course
    @lessons = Lesson.includes(lesson_modules: :questions).where(course_id: @course.id).paginate(:page => params[:page], per_page: 1)

    allow(view).to receive(:user_signed_in?) { true }
    allow(view).to receive(:current_user) { FactoryGirl.build(:user) }
  end

  it "renders a list of lessons" do
    #TODO issue with will paginate total pages
=begin
    render
    assert_select "tr>td", :text => "Lesson Name".to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
=end
    #TODO need to add more tests for the other params
  end
end
