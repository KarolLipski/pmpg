require 'spec_helper'

feature "update offer" do
  before(:each) do
    titles = FactoryGirl.create_list(:title, 3)
    @offer = FactoryGirl.create(:offer)
    visit edit_offer_path(@offer)
    fill_offer_fields
    check 'offer_offer_titles_attributes_0__destroy'
    check 'offer_offer_titles_attributes_1__destroy'
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

    Offer.count.should == 1
    OfferTitle.count.should == 0
  end
end

feature "update offer titles" do
  scenario "remove title" do
    offer = FactoryGirl.create(:offer_with_titles)
    visit edit_offer_path(offer)
    fill_offer_fields
    uncheck 'offer_offer_titles_attributes_0__destroy'
    click_button 'Save'

    Offer.count.should == 1
    OfferTitle.count.should == 1
  end

  scenario "add title" do
    title = FactoryGirl.create(:title)
    offer = FactoryGirl.create(:offer_with_titles)
    visit edit_offer_path(offer)
    fill_offer_fields
    check 'offer_offer_titles_attributes_2__destroy'
    fill_in "offer_offer_titles_attributes_2_quantity", with: '13'
    click_button 'Save'
    
    Offer.count.should == 1
    OfferTitle.count.should == 3
  end

end 

def fill_offer_fields
  fill_in 'offer_name', with:'offer_name'
  fill_in 'offer_description',with: 'description'
  fill_in 'offer_price',with: '10.23'
end