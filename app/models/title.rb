# == Schema Information
#
# Table name: titles
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  title_frequency_id :integer
#  archive            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  publisher_id       :integer
#

class Title < ActiveRecord::Base

  belongs_to :title_frequency
  belongs_to :publisher
  validates_presence_of :title, :title_frequency, :publisher

end
