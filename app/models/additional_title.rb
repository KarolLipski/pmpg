class AdditionalTitle < ActiveRecord::Base
  belongs_to :sell_point_offer
  belongs_to :title
  validates_numericality_of :quantity, only_integer: true, greater_than: 0
  
end
