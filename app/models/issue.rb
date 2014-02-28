# == Schema Information
#
# Table name: issues
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  issue_frequency_id :integer
#  archive            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  publisher_id       :integer
#

class Issue < ActiveRecord::Base

  belongs_to :issue_frequency
  belongs_to :publisher
  validates_presence_of :title, :issue_frequency, :publisher

end
