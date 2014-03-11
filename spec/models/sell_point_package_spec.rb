# == Schema Information
#
# Table name: sell_point_packages
#
#  id            :integer          not null, primary key
#  sell_point_id :integer
#  package_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe SellPointPackage do
  it "has a valid factory" do
    FactoryGirl.build(:sell_point_package).should be_valid
  end
end
