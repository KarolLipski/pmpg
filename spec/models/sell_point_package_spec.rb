require 'spec_helper'

describe SellPointPackage do
  it "has a valid factory" do
    FactoryGirl.build(:sell_point_package).should be_valid
  end
end
