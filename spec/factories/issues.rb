# == Schema Information
#
# Table name: issues
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  issue_frequency_id :integer
#  archive            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  publisher_id       :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title "Title"
    association :issue_frequency, factory: :issue_frequency 
    archive false
    association :publisher, factory: :publisher
  end
end
