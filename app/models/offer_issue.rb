# == Schema Information
#
# Table name: offer_issues
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  issue_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class OfferIssue < ActiveRecord::Base
  belongs_to :offer
  belongs_to :issue
end
