# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Offer do
  it "has a valid factory" do
    FactoryGirl.build(:offer).should be_valid
  end
end
