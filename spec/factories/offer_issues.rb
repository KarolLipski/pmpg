# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer_issue do
    association :offer, factory: :offer
    association :issue, factory: :issue
  end
end
