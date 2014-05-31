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
    start_date '2012-01-01'
    end_date '2015-01-01'
    price '12.34'
  end
end
