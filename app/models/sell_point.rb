class SellPoint < ActiveRecord::Base
  belongs_to :chain
  has_many :addresses, as: :addressable, :class_name => "Address", :dependent => :destroy
  has_many :contacts, as: :contactable, :class_name => "Contact", :dependent => :destroy
  
  validates_presence_of :name
  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true
end
