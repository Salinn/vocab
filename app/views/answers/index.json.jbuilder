json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :user_id, :time_to_complete, :correct
  json.url answer_url(answer, format: :json)
end
