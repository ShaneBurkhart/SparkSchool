# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    unit_id 1
    name "MyString"
    description "MyText"
    sequence(:lesson_number)
    body 'mybody'
  end
end
