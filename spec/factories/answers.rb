FactoryGirl.define do
  factory :answer do
    association :question, factory: :question
    association :user, factory: :user
    time_to_complete 3
    correct false
    association :answer_option, factory: :answer_option
  end
end
