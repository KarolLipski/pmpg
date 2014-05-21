# == Schema Information
#
# Table name: offer_titles
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  title_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer_title do
    quantity 5
    association :offer, factory: :offer
    association :title, factory: :title
  end
end
