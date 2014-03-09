require 'spec_helper'

feature "add new offer" do
  scenario "with valid data" do
    issues = FactoryGirl.create_list(:issue, 3)
    visit new_offer_path
    fill_in 'offer_name', with:'offer_name'
    fill_in 'offer_description',with: 'description'
    fill_in 'offer_price',with: '10.23'
    find(:xpath, "//input[@value='#{issues[0].id}']").set(true)
    find(:xpath, "//input[@value='#{issues[1].id}']").set(true)
    click_button 'Save'

    Offer.count.should == 1
    OfferIssue.count.should == 2
  end

end