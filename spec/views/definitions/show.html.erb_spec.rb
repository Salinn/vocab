require 'rails_helper'

RSpec.describe "definitions/show", type: :view do
  before(:each) do
    @definition = assign(:definition, Definition.create!(
      :word_definition => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    #TODO fix these tests
    #render
    #expect(rendered).to match(/MyText/)
  end
end
