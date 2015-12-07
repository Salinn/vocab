require 'rails_helper'

RSpec.describe "lesson_extensions/index", type: :view do
  before(:each) do
    assign(:lesson_extensions, [
      LessonExtension.create!(
        :lesson => nil,
        :user => nil
      ),
      LessonExtension.create!(
        :lesson => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of lesson_extensions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
