class AdditionalTitle < ActiveRecord::Base
  belongs_to :sell_point_offer
  belongs_to :title
end
