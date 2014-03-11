# == Schema Information
#
# Table name: sell_point_offers
#
#  id            :integer          not null, primary key
#  offer_id      :integer
#  sell_point_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point_offer do
    association :offer, factory: :offer
    association :sell_point, factory: :sell_point
  end
end
