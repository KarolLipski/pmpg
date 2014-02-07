# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher_address do
    company_name "MyString"
    street "MyString"
    street_no 1
    postal_code "MyString"
    string "MyString"
    city "MyString"
    nip "MyString"
    type ""
    publisher nil
  end
end
