FactoryGirl.define do
  factory :lesson_extension do
    extension_date "2015-12-06 20:25:13"
    association :lesson, factory: :lesson
    association :user, factory: :user
  end
end
