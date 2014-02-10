# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher_contact do
    name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    email {Faker::Internet.email}
    phone {"#{rand(800)+100}-#{rand(800)+100}-#{rand(800)+100}"}
    association :publisher , factory: :publisher
  end
end
