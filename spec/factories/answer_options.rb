FactoryGirl.define do
  factory :answer_option do
    association :lesson_word, factory: :lesson_word_no_call_backs
    association :question, factory: :question
  end
end
