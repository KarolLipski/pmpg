# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point_offer do
    association :offer, factory: :offer
    association :sell_point, factory: :sell_point
  end
end
