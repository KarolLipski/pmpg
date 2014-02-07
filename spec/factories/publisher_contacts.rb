# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher_contact do
    contact_name "MyString"
    contact_email "MyString"
    contact_phone "MyString"
    publisher nil
  end
end
