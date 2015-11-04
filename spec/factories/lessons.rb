FactoryGirl.define do
  factory :lesson do
    lesson_name 'Math'
    lesson_points 30
    lesson_start_time DateTime.now
    lesson_end_date DateTime.now + 1.week
    course_id FactoryGirl.create(:course).id
    penalty 10
  end
end
