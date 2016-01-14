FactoryGirl.define do
  factory :question do
    association :lesson_module, factory: :lesson_module
    association :lesson_word, factory: :lesson_word
  end
end
