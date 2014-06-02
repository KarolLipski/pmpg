# == Schema Information
#
# Table name: additional_titles
#
#  id                  :integer          not null, primary key
#  sell_point_offer_id :integer
#  title_id            :integer
#  quantity            :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class AdditionalTitle < ActiveRecord::Base
  belongs_to :sell_point_offer
  belongs_to :title
  validates_numericality_of :quantity, only_integer: true, greater_than: 0
  
end
