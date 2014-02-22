# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chain do
    name {Faker::Company.name}
  end
end
