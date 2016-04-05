FactoryGirl.define do
  factory :grade do
    association :user, factory: :user
    grade 100
    association :course, factory: :course
    association :lesson, factory: :lesson
    association :lesson_module, factory: :lesson_module
  end
end
