FactoryGirl.define do
  factory :lesson_module do
    name 'Definition'
    attempts 3
    number_of_answers 4
    in_use true
    value_percentage 30
    association :lesson, factory: :lesson

    factory :lesson_module_with_lesson_words do
      after(:create) do |lesson_module|
        create(:lesson_word, article: lesson_module)
      end
    end
  end
end
