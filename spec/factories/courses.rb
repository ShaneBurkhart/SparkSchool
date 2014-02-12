# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "MyString"
    description "Some awesome stuff about MCU's."
    tag "MCU"
  end
end
