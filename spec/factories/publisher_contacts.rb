# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher_contact do
    name "Jan Kowalski"
    email "kowalski@gmail.com"
    phone "888241205"
    association :publisher , factory: :publisher
  end
end
