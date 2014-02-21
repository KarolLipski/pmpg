require 'spec_helper'

feature "add new publisher" do
  before(:each) do
    visit new_publisher_path
  end
  context "with valid data" do
    before(:each) do
      fill_fields
    end
    scenario "should add new Publisher and related data" do
      click_button 'Save'
      # save_and_open_page
      Publisher.count.should == 1
      Address.where(address_type: 'invoice').count.should == 1
      Address.where(address_type: 'correspond').count.should == 1
      Contact.count.should == 1
    end  
  end
  context "with invalid data" do
    before(:each) do
      fill_fields(:fake)
    end
    scenario "should not add Publisher and related data" do
      click_button 'Save'
      Publisher.count.should == 0
      Address.where(address_type: 'invoice').count.should == 0
      Address.where(address_type: 'correspond').count.should == 0
      Contact.count.should == 0
    end
  end
end

def fill_fields(fake = false)
  company_name = fake ? '' : 'Firma krzak sp.z.oo'

  fill_in 'company_full_name', with: company_name
  fill_in 'invoice_street', with: 'Puławska'
  fill_in 'invoice_street_no', with: '15'
  fill_in 'invoice_postal_code', with: '05-520'
  fill_in 'invoice_city', with: 'Warszawa'
  fill_in 'invoice_nip', with: '123-112-77-87'
  fill_in 'correspond_company_name', with: 'Krzak.pl'
  fill_in 'correspond_street', with: 'Puławska'
  fill_in 'correspond_postal_code', with: '05-500'
  fill_in 'correspond_street_no', with: 'puławska'    
  fill_in 'correspond_city', with: 'Puławska'    
  fill_in 'contact_name', with: 'zenon słowik'
  fill_in 'contact_email', with: 'zenon@wp.pl'
  fill_in 'contact_phone', with: '48500234567'
end