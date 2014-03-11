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

class SellPointOffer < ActiveRecord::Base
  belongs_to :offer
  belongs_to :sell_point
end
