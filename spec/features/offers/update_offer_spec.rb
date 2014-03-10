require 'spec_helper'

feature "update offer" do
  before(:each) do
    issues = FactoryGirl.create_list(:issue, 3)
    @offer = FactoryGirl.create(:offer)
    visit edit_offer_path(@offer)
    fill_in 'offer_name', with:'offer_name'
    fill_in 'offer_description',with: 'description'
    find(:xpath, "//input[@value='#{issues[0].id}']").set(true)
    find(:xpath, "//input[@value='#{issues[1].id}']").set(true)
  end
  scenario "with valid data" do
    fill_in 'offer_price',with: '10.23'
    click_button 'Save'

    Offer.count.should == 1
    OfferIssue.count.should == 2
  end

  scenario "with invalid data" do
    fill_in 'offer_price',with: 'aaa'
    click_button 'Save'

    Offer.count.should == 1
    OfferIssue.count.should == 0
  end
end