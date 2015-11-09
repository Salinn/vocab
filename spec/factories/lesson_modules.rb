FactoryGirl.define do
  factory :lesson_module do
    name "MyString"
    attempts 1
    lesson nil
    in_use false
    value_percentage 1
  end
end
