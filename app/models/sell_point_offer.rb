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
  has_many :additional_titles

  validates_presence_of :start_date, :end_date, :price
  validates_numericality_of :price
end
