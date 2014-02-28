# == Schema Information
#
# Table name: chains
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Chain do
  it "has a valid factory" do FactoryGirl.build(:chain).should be_valid end
  it "is invalid without name" do FactoryGirl.build(:chain, name: nil).should_not be_valid end
end
