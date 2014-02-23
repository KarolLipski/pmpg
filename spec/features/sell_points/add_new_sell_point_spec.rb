require 'spec_helper'

feature "add new sell point" do
  before(:each) do
    visit new_sell_point_path
  end
  context "with valid data" do
    scenario "should add new multiple sellpoint with all data" do
      fill_point_fields
      choose 'sell_point_chained_true'
      click_button 'Save'
      SellPoint.count.should == 1
      Chain.count.should == 1
      # should add address both to point and chain
      Address.where(address_type: 'invoice').count.should == 2
      Address.where(address_type: 'correspond').count.should == 2
      Address.where(address_type: 'delivery').count.should == 1
      Contact.count.should == 1
    end
    scenario "should add new single sellpoint with all data" do
      fill_point_fields
      choose 'sell_point_chained_false'
      click_button 'Save'
      SellPoint.count.should == 1
      Chain.count.should == 0
      Address.where(address_type: 'invoice').count.should == 1
      Address.where(address_type: 'correspond').count.should == 1
      Address.where(address_type: 'delivery').count.should == 1
      Contact.count.should == 1
    end
  end
  context "with invalid data" do
    scenario "should not add sell point and related data" do
      fill_point_fields(:fake)
      click_button 'Save'
      SellPoint.count.should == 0
      Chain.count.should == 0
      Address.count.should == 0
      Contact.count.should == 0
    end
  end 
end

def fill_point_fields(fake = false)
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
  fill_in 'delivery_company_name', with: 'Krzak.pl'
  fill_in 'delivery_street', with: 'Puławska'
  fill_in 'delivery_postal_code', with: '05-500'
  fill_in 'delivery_street_no', with: 'puławska'    
  fill_in 'delivery_city', with: 'Puławska' 
  fill_in 'contact_name', with: 'zenon słowik'
  fill_in 'contact_email', with: 'zenon@wp.pl'
  fill_in 'contact_phone', with: '48500234567'
end