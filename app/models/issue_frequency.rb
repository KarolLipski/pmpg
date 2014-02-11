class IssueFrequency < ActiveRecord::Base
  has_many :issues, :class_name => "Issue"
end
