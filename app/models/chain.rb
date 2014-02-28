# == Schema Information
#
# Table name: chains
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Chain < ActiveRecord::Base

  has_many :sell_points, :class_name => "SellPoint"
  has_many :addresses, as: :addressable, :class_name => "Address", :dependent => :destroy

  validates_presence_of :name
  
end
