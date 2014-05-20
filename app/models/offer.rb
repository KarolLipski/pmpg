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
has_many :offer_titles, :dependent => :destroy
has_many :titles, :through => :offer_titles

accepts_nested_attributes_for :offer_titles, :reject_if => proc { |att| att.blank?}, :allow_destroy => true
end
