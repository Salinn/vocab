require 'rails_helper'

RSpec.describe "word_videos/new", type: :view do
  before(:each) do
    assign(:word_video, WordVideo.new(
      :video_link => "MyString",
      :video_description => "MyString",
      :word => nil
    ))
  end

  it "renders new word_video form" do
    render

    assert_select "form[action=?][method=?]", word_videos_path, "post" do

      assert_select "input#word_video_video_link[name=?]", "word_video[video_link]"

      assert_select "input#word_video_video_description[name=?]", "word_video[video_description]"

      assert_select "input#word_video_word_id[name=?]", "word_video[word_id]"
    end
  end
end
