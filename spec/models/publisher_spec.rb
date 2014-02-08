require 'spec_helper'

describe Publisher do
  it "has a valid factory" do
    FactoryGirl.build(:publisher).should be_valid
  end
  it "is invalid without name" do
    FactoryGirl.build(:publisher, name: nil).should_not be_valid
  end
end
