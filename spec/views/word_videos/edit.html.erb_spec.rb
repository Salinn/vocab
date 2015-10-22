require 'rails_helper'

RSpec.describe "word_videos/edit", type: :view do
  before(:each) do
    @word_video = assign(:word_video, WordVideo.create!(
      :video_link => "MyString",
      :video_description => "MyString",
    ))
    @words = Word.all
  end

  it "renders the edit word_video form" do
    render

    assert_select "form[action=?][method=?]", word_video_path(@word_video), "post" do

      assert_select "input#word_video_video_link[name=?]", "word_video[video_link]"

      assert_select "input#word_video_video_description[name=?]", "word_video[video_description]"

    end
  end
end
