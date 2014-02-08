# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher_address do
    company_name "Company Name"
    street "Puławska"
    street_no 24
    postal_code "04-520"
    city "Warszawa"
    nip "123-123-22-34"
    address_type "invoice"
    association :publisher, factory: :publisher
  end
end
