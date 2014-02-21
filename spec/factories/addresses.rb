# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    company_name {Faker::Company.name}
    street {Faker::Address.street_name}
    street_no {Faker::Address.building_number}
    postal_code {"0#{rand(9)}-#{rand(600)+100}"}
    city {Faker::Address.city}
    nip {"#{rand(80)+100}-#{rand(80)+100}-#{rand(89)+10}-#{rand(89)+10}"}
    address_type "invoice"
    association :addressable, factory: :publisher
  end
end
