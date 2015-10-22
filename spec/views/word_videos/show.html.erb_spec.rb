require 'rails_helper'

RSpec.describe "word_videos/show", type: :view do
  before(:each) do
    @word_video = assign(:word_video, WordVideo.create!(
      :video_link => "Video Link",
      :video_description => "Video Description",
    ))
  end

  it "renders attributes in <p>" do
    #TODO fix these tests
    #render
    #expect(rendered).to match(/Video Link/)
    #expect(rendered).to match(/Video Description/)
    #expect(rendered).to match(//)
  end
end
