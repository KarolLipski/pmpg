require 'spec_helper'

feature "add new offer" do
  before(:each) do
    titles = FactoryGirl.create_list(:title, 3)
    visit new_offer_path
    fill_in 'offer_name', with:'offer_name'
    fill_in 'offer_description',with: 'description'
    check 'offer_offer_titles_attributes_0__destroy'
    check 'offer_offer_titles_attributes_1__destroy'
    # find(:xpath, "//input[@value='#{titles[1].id}']").set(true)
    fill_in "offer_offer_titles_attributes_0_quantity", with: '13'
    fill_in "offer_offer_titles_attributes_1_quantity", with: '23'
  end
  scenario "with valid data" do
    fill_in 'offer_price',with: '10.23'
    click_button 'Save'

    Offer.count.should == 1
    OfferTitle.count.should == 2
  end

  scenario "with invalid data" do
    fill_in 'offer_price',with: 'aaa'
    click_button 'Save'

    Offer.count.should == 0
    OfferTitle.count.should == 0
  end
end