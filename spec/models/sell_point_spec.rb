require 'spec_helper'

describe SellPoint do
  it "has a valid factory" do FactoryGirl.build(:sell_point).should  be_valid end
  it "is invalid without name" do FactoryGirl.build(:sell_point, name: nil).should_not be_valid end
end
