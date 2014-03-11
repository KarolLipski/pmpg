# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point_package do
    association :sell_point, factory: :sell_point
    association :package, factory: :package
  end
end
