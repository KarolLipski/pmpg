class SellPointPackage < ActiveRecord::Base
  belongs_to :sell_point
  belongs_to :package
end
