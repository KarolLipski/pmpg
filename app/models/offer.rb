# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

class Offer < ActiveRecord::Base
validates_presence_of :name, :description, :price
validates_numericality_of :price
has_many :offer_issues, :dependent => :destroy
has_many :issues, :through => :offer_issues
end
