require 'rails_helper'

RSpec.describe "word_videos/index", type: :view do
  before(:each) do
    assign(:word_videos, [
      WordVideo.create!(
        :video_link => "Video Link",
        :video_description => "Video Description",
        :word => nil
      ),
      WordVideo.create!(
        :video_link => "Video Link",
        :video_description => "Video Description",
        :word => nil
      )
    ])
  end

  it "renders a list of word_videos" do
    render
    assert_select "tr>td", :text => "Video Link".to_s, :count => 2
    assert_select "tr>td", :text => "Video Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
