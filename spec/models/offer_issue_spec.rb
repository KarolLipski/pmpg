require 'spec_helper'

describe OfferIssue do
  it "has a valid factory" do
    FactoryGirl.build(:offer_issue).should be_valid
  end
end
