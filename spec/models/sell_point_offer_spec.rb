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
  it "is invalid without start date" do
    FactoryGirl.build(:sell_point_offer, start_date: nil).should_not be_valid
  end
  it "is invalid without end date" do
    FactoryGirl.build(:sell_point_offer, end_date: nil).should_not be_valid
  end
  it "is invalid without price" do
    FactoryGirl.build(:sell_point_offer, price: nil).should_not be_valid
  end
  it "is invalid with invalid price format" do
    FactoryGirl.build(:sell_point_offer, price: 'asb').should_not be_valid
  end
  it "is valid with integer price" do
    FactoryGirl.build(:sell_point_offer, price: 10).should be_valid
  end
  it "is valid with fload price" do
    FactoryGirl.build(:sell_point_offer, price: 10.34).should be_valid
  end
end
