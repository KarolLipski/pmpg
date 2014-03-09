require 'spec_helper'

describe Offer do
  it "has a valid factory" do
    FactoryGirl.build(:offer).should be_valid
  end
end
