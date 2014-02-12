# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    course_id 1
    name "MyString"
    sequence(:unit_number)
  end
end
