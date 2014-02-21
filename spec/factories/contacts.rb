# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    email {Faker::Internet.email}
    phone {"#{rand(800)+100}-#{rand(800)+100}-#{rand(800)+100}"}
    association :contactable , factory: :publisher
  end
end
