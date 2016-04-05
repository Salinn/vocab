require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  let(:grade) {FactoryGirl.create(:grade)}
  before(:each) do
    assign(:grades, [
        grade, grade
    ])
  end

  it "renders a list of grades" do
    render
    assert_select "tr>td", :text => grade.user.to_s, :count => 2
    assert_select "tr>td", :text => 100.to_s, :count => 2
    assert_select "tr>td", :text => grade.course.to_s, :count => 2
    assert_select "tr>td", :text => grade.lesson.to_s, :count => 2
    assert_select "tr>td", :text => grade.lesson_module.to_s, :count => 2
  end
end
