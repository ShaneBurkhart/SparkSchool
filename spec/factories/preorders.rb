# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preorder do
    # General
    first_name "First"
    last_name "Last"
    email "me@email.com"

    # Shipping
    address "111 Some St."
    city "St. Louis"
    state "Missouri"
    zipcode "111111"

    # Credit
    stripe_customer_id "cust_asdfasdfasdf"
  end
end
