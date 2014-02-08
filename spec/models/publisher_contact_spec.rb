require 'spec_helper'

describe PublisherContact do
  it "has a valid factory" do FactoryGirl.build(:publisher_contact).should be_valid end
  it "is invalid without name" do FactoryGirl.build(:publisher_contact,name: nil).should_not be_valid end
  it "is invalid without email" do FactoryGirl.build(:publisher_contact,email: nil).should_not be_valid end
  it "is invalid without phone" do FactoryGirl.build(:publisher_contact,phone: nil).should_not be_valid end
  it "is invalid without publisher_id" do FactoryGirl.build(:publisher_contact,publisher: nil).should_not be_valid end
  it "email should have proper format" do
    FactoryGirl.build(:publisher_contact, email: 'asd21werk.pl').should_not be_valid
  end
  it "phone should have proper format" do
    FactoryGirl.build(:publisher_contact, phone: '717-23-48').should be_valid
    FactoryGirl.build(:publisher_contact, phone: '+48500-253-458').should be_valid
    FactoryGirl.build(:publisher_contact, phone: '48500253458').should be_valid
    FactoryGirl.build(:publisher_contact, phone: '48500-253-458').should be_valid
    FactoryGirl.build(:publisher_contact, phone: '+4asd!-253-4a8').should be_valid
  end    


end
