require 'rails_helper'

RSpec.describe "word_roots/show", type: :view do
  let(:user) { FactoryGirl.create(:user) }
  let(:current_user) { user }

  before(:each) do
    @word_root = assign(:word_root, WordRoot.create!(
      :root_name => "Root Name",
      :root_definition => "MyText"
    ))
    sign_in(user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Root Name/)
    expect(rendered).to match(/MyText/)
  end
end
