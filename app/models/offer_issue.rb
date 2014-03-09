class OfferIssue < ActiveRecord::Base
  belongs_to :offer
  belongs_to :issue
end
