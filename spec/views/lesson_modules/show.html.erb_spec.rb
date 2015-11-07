require 'rails_helper'

RSpec.describe "lesson_modules/show", type: :view do
  before(:each) do
    @lesson_module = assign(:lesson_module, LessonModule.create!(
                                              name: 'Definition',
                                              attempts: 3,
                                              in_use: true,
                                              value_percentage: 30
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Definition/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/true/)
    expect(rendered).to match(/30/)
  end
end
