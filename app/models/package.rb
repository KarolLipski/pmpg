# == Schema Information
#
# Table name: packages
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

class Package < ActiveRecord::Base
validates_presence_of :name, :description, :price
validates_numericality_of :price
has_many :sell_point_packages, :dependent => :destroy
has_many :sell_points , :through => :sell_point_packages
end
