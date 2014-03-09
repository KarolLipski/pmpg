require 'spec_helper'

describe SellPointOffer do
  it "has a valid factory" do
    FactoryGirl.build(:sell_point_offer).should be_valid 
  end
end
