FactoryGirl.define do
  factory :lesson do
    lesson_name 'Math'
    lesson_points 30
    lesson_start_time DateTime.now
    lesson_end_date DateTime.now + 1.week
    penalty 10
    association :course, factory: :course
  end
end
