class Chain < ActiveRecord::Base
  has_many :sell_points, :class_name => "SellPoint"
  has_many :addressess, as: :addressable, :class_name => "addresses", :dependent => :destroy

  validates_presence_of :name
  
end
