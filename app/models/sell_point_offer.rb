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
  validates_presence_of :start_date, :end_date, :price
  validates_numericality_of :price
  validates_format_of :start_date, :end_date, with: /[0-9]{4}-[0-9]{2}-[0-9]{2}/

  belongs_to :offer
  belongs_to :sell_point
  has_many :additional_titles, :dependent => :destroy
  has_many :added_titles , :through => :additional_titles, 
    :source => :title

  accepts_nested_attributes_for :additional_titles, 
  :reject_if => proc { |att| 
      additional_title = AdditionalTitle.new(quantity: att['quantity'])
      !additional_title.valid?
  }, allow_destroy: true
  
end
