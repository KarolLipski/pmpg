class SellPoint < ActiveRecord::Base
  belongs_to :chain
  has_many :addresses, as: :addressable, :class_name => "Address", :dependent => :destroy

  validates_presence_of :name
end
