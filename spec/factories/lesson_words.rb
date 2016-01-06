FactoryGirl.define do
  factory :lesson_word do
    association :lesson, factory: :lesson
    association :word, factory: :word

    factory :lesson_word_no_call_backs do
      after(:build) do |lesson_word|
        allow(lesson_word).to receive(:can_add_lesson_word).and_return(true)
      end
    end
  end
end
