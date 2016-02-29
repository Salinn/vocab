FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    start_time "2015-11-28 16:05:38"
    end_time "2015-11-28 16:05:38"
    association :lesson, factory: :lesson
  end
end
