require 'spec_helper'

feature "add new chain" do
  before(:each) do
    visit new_chain_path
  end
  context "with valid data" do
    scenario "should add new chain with all data" do
      fill_chain_fields
      click_button 'Save'
      Chain.count.should == 1
      Address.where(address_type: 'invoice').count.should == 1
      Address.where(address_type: 'correspond').count.should == 1
      Contact.count.should == 1
    end
    scenario "should add new chain with all data" do
      fill_chain_fields
      click_button 'Save'
      Chain.count.should == 0
      Address.where(address_type: 'invoice').count.should == 1
      Address.where(address_type: 'correspond').count.should == 1
      Contact.count.should == 1
    end
  end
  context "with invalid data" do
    scenario "should not add sell point and related data" do
      fill_chain_fields(:fake)
      click_button 'Save'
      Chain.count.should == 0
      Address.count.should == 0
      Contact.count.should == 0
    end
  end 
end

def fill_chain_fields(fake = false)
  company_name = fake ? '' : 'Firma krzak sp.z.oo'

  fill_in 'name', with: 'point'
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