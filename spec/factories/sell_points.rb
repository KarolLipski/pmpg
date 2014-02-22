# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point do
    name {Faker::Company.name}
    association :chain, factory: :chain
  end
end

