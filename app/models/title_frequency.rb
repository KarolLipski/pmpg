# == Schema Information
#
# Table name: title_frequencies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TitleFrequency < ActiveRecord::Base
  has_many :titles, :class_name => "Title"
end
