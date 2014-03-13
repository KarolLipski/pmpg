# == Schema Information
#
# Table name: sell_points
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  chain_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class SellPoint < ActiveRecord::Base
  
  belongs_to :chain
  has_many :addresses, as: :addressable, :class_name => "Address", :dependent => :destroy
  has_many :contacts, as: :contactable, :class_name => "Contact", :dependent => :destroy
  has_many :sell_point_packages, :dependent => :destroy
  has_many :packages , :through => :sell_point_packages
  validates_presence_of :name
  
  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true
end
