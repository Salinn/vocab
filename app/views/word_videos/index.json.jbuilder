json.array!(@word_videos) do |word_video|
  json.extract! word_video, :id, :video_link, :video_description, :word_id
  json.url word_video_url(word_video, format: :json)
end
