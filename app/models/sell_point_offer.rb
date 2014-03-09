class SellPointOffer < ActiveRecord::Base
  belongs_to :offer
  belongs_to :sell_point
end
