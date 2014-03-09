require 'spec_helper'

feature "add new offer" do
  scenario "with valid data" do
    issues = FactoryGirl.create_list(:issue, 3)
    visit new_offer_path
    fill_in 'name', with:'offer_name'
    fill_in 'description',with: 'description'
    fill_in 'price',with: '10.23'
    check("issue_id_#{issues[0].id}")
    check("issue_id_#{issues[1].id}")
    click_button 'Save'

    Offer.count.should == 1
    OfferIssue.count.should == 2
  end

end