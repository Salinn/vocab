FactoryGirl.define do
  factory :lesson_word do
    association :lesson, factory: :lesson
    association :word, factory: :word
  end
end
