# == Schema Information
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  phone            :string(255)
#  publisher_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  contactable_id   :integer
#  contactable_type :string(255)
#

require 'spec_helper'

describe Contact do
  it "has a valid factory" do FactoryGirl.build(:contact).should be_valid end
  it "is invalid without name" do FactoryGirl.build(:contact,name: nil).should_not be_valid end
  it "is invalid without email" do FactoryGirl.build(:contact,email: nil).should_not be_valid end
  it "is invalid without phone" do FactoryGirl.build(:contact,phone: nil).should_not be_valid end
  it "email should have proper format" do
    FactoryGirl.build(:contact, email: 'asd21werk.pl').should_not be_valid
  end
  it "phone should have proper format" do
    FactoryGirl.build(:contact, phone: '717-23-48').should be_valid
    FactoryGirl.build(:contact, phone: '+48500-253-458').should be_valid
    FactoryGirl.build(:contact, phone: '48500253458').should be_valid
    FactoryGirl.build(:contact, phone: '48500-253-458').should be_valid
    FactoryGirl.build(:contact, phone: '+4asd!-253-4a8').should be_valid
  end    


end
