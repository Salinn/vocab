require 'rails_helper'

RSpec.describe "definitions/show", type: :view do
  before(:each) do
    @definition = assign(:definition, Definition.create!(
      :word_definition => "MyText",
      :belongs_to => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
