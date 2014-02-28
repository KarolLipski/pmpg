class Issue < ActiveRecord::Base

  belongs_to :issue_frequency
  belongs_to :publisher
  validates_presence_of :title, :issue_frequency, :publisher

end
