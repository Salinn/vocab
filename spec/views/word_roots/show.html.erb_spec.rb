require 'rails_helper'

RSpec.describe "word_roots/show", type: :view do
  before(:each) do
    @word_root = assign(:word_root, WordRoot.create!(
      :root_name => "Root Name",
      :root_definition => "Root Definition"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Root Name/)
    expect(rendered).to match(/Root Definition/)
  end
end
