class Offer < ActiveRecord::Base
validates_presence_of :name, :description, :price
validates_numericality_of :price
has_many :offer_issues
has_many :issues, :through => :offer_issues
end