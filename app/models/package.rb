class Package < ActiveRecord::Base
validates_presence_of :name, :description, :price
validates_numericality_of :price
has_many :sell_point_packages, :dependent => :destroy
has_many :sell_points , :through => :sell_point_packages
end
