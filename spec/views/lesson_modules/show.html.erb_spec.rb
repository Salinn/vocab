require 'rails_helper'

RSpec.describe "lesson_modules/show", type: :view do
  before(:each) do
    @lesson_module = assign(:lesson_module, LessonModule.create!(
      :name => "Name",
      :attempts => 1,
      :lesson => nil,
      :in_use => false,
      :value_percentage => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
  end
end
