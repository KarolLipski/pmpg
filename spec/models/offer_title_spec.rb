# == Schema Information
#
# Table name: offer_issues
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  issue_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe OfferTitle do
  it "has a valid factory" do
    FactoryGirl.build(:offer_title).should be_valid
  end
  it "is invalid without quantity" do
    FactoryGirl.build(:offer_title, quantity: nil).should_not be_valid
  end
end
