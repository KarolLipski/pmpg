# == Schema Information
#
# Table name: offer_titles
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  title_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer
#

class OfferTitle < ActiveRecord::Base
  belongs_to :offer
  belongs_to :title
  validates_numericality_of :quantity, only_integer: true, greater_than: 0
end
