FactoryGirl.define do
  factory :payment do
    first_name "MyString"
    last_name "MyString"
    last4 "MyString"
    amount "9.99"
    success false
    authorization_code "MyString"
  end
end
