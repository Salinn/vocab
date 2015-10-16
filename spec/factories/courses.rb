FactoryGirl.define do
  factory :course do
    class_name 'Test Course 1'
    start_date Date.today
    end_date Date.today + 3.months
  end
end