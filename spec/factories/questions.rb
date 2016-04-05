FactoryGirl.define do
  factory :question do
    association :lesson_module, factory: :lesson_module
    association :lesson_word, factory: :lesson_word
    #association :answer_option, factory: :answer_option

    factory :questions_with_answer_options do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        options_count 4
      end
      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:answer_option, evaluator.options_count, lesson_word)
      end
    end
  end
end
