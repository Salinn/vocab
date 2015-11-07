json.array!(@course_emails) do |course_email|
  json.extract! course_email, :id, :course_id, :title, :content
  json.url course_email_url(course_email, format: :json)
end
