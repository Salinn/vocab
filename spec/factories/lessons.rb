FactoryGirl.define do
  factory :lesson do
    lesson_name 'Math'
    lesson_points 30
    lesson_start_time DateTime.now
    lesson_end_date DateTime.now + 1.week
    penalty 10
    association :course, factory: :course

    factory :lesson_no_call_backs do
      after(:build) do |lesson|
        allow(lesson).to receive(:create_modules).and_return(true)
      end
    end
  end
end
