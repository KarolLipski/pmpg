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

require 'spec_helper'

describe Issue do
end
