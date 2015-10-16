require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :lesson_name => "Lesson Name",
        :lesson_points => 1,
        :course => nil,
        :penalty => 2
      ),
      Lesson.create!(
        :lesson_name => "Lesson Name",
        :lesson_points => 1,
        :course => nil,
        :penalty => 2
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Lesson Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
