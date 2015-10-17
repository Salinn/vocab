require 'rails_helper'

RSpec.describe "word_forms/show", type: :view do
  before(:each) do
    @word_form = assign(:word_form, WordForm.create!(
      :associated_word => "Associated Word",
      :word => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Associated Word/)
    expect(rendered).to match(//)
  end
end
