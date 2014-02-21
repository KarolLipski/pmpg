require 'spec_helper'

describe Address do
  it "has a valid factory" do
    FactoryGirl.build(:address).should be_valid
  end
  it "is invalid without company_name" do FactoryGirl.build(:address, company_name: nil).should_not be_valid end
  it "is invalid without street" do FactoryGirl.build(:address, street: nil).should_not be_valid end
  it "is invalid without street_no" do FactoryGirl.build(:address, street_no: nil).should_not be_valid end
  it "is invalid without postal_code" do FactoryGirl.build(:address, postal_code: nil).should_not be_valid end
  it "is invalid without city" do FactoryGirl.build(:address, city: nil).should_not be_valid end
  it "is valid without nip when type is invoice" do 
    FactoryGirl.build(:address, nip: nil, address_type: 'invoice').should_not be_valid 
  end
  it "nip can be blank when type is correspond" do 
    FactoryGirl.build(:address, nip: nil, address_type: 'correspond').should be_valid 
  end
  it "is invalid without type" do FactoryGirl.build(:address, address_type: nil).should_not be_valid end
  it "nip should be numeric" do
    FactoryGirl.build(:address, nip: '123-123-55-23').should be_valid
    FactoryGirl.build(:address, nip: 'asd-123-55-23').should_not be_valid
  end
  it "postal_code should have proper format" do
    FactoryGirl.build(:address, postal_code: '05-234').should be_valid
    FactoryGirl.build(:address, nip: 'aa-234').should_not be_valid
  end
end
