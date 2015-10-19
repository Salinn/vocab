require 'rails_helper'

RSpec.describe "word_forms/show", type: :view do
  before(:each) do
    @word_form = assign(:word_form, WordForm.create!(
      :associated_word => "Associated Word"
    ))
  end

  it "renders attributes in <p>" do
    #TODO fix these tests
    #render
    #expect(rendered).to match(/MyText/)
  end
end
