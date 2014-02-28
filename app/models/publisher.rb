# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Publisher < ActiveRecord::Base
  
  default_scope { includes :addresses, :contacts}

  before_validation :set_name

  validates_presence_of :name
  
  has_many :addresses, as: :addressable, :class_name => "Address", :dependent => :destroy
  has_many :contacts, as: :contactable, :class_name => "Contact", :dependent => :destroy
  has_many :issues, :class_name => "Issue", :dependent => :destroy
  
  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true

  def set_name
    addresses.each do |addres|
      self.name = addres.company_name if addres.address_type == 'invoice'
    end
  end
end
