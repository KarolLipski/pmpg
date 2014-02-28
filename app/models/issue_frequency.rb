# == Schema Information
#
# Table name: issue_frequencies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class IssueFrequency < ActiveRecord::Base
  has_many :issues, :class_name => "Issue"
end
