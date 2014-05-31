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
    start_date {"#{rand(14)+2000}-#{rand(11)+1}-#{rand(30)+1}"}
    end_date {"#{rand(14)+2000}-#{rand(11)+1}-#{rand(30)+1}"}
    price {"#{rand(98)}.#{rand(98)}"}
  end
end
