class Publisher < ActiveRecord::Base
  
  default_scope { includes :addresses, :contacts}

  before_validation :set_name
  validates_presence_of :name
  has_many :addresses, :class_name => "PublisherAddress", :dependent => :destroy, :inverse_of => :publisher
  has_many :contacts, :class_name => "PublisherContact", :dependent => :destroy, :inverse_of => :publisher
  has_many :issues, :class_name => "Issue", :dependent => :destroy
  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true

  def set_name
    addresses.each do |addres|
      self.name = addres.company_name if addres.address_type == 'invoice'
    end
  end
end
