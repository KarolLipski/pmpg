# == Schema Information
#
# Table name: sell_point_offers
#
#  id            :integer          not null, primary key
#  offer_id      :integer
#  sell_point_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe SellPointOffer do
  it "has a valid factory" do
    FactoryGirl.build(:sell_point_offer).should be_valid 
  end
end
