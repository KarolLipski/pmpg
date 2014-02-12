# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title "Title"
    association :issue_frequency, factory: :issue_frequency 
    archive false
    association :publisher, factory: :publisher
  end
end
