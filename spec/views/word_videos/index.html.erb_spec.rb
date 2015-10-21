require 'rails_helper'

RSpec.describe "word_videos/index", type: :view do
  before(:each) do
    assign(:word_videos, [
      WordVideo.create!(
        :video_link => "Video Link",
        :video_description => "Video Description",
      ),
      WordVideo.create!(
        :video_link => "Video Link",
        :video_description => "Video Description",
      )
    ])
  end

  it "renders a list of word_videos" do
    #TODO fix these tests
    #render
    #assert_select "tr>td", :text => "Video Link".to_s, :count => 2
    #assert_select "tr>td", :text => "Video Description".to_s, :count => 2

  end
end
