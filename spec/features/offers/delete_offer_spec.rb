require 'spec_helper'

feature "delete offer" do
  before(:each) do
    titles = FactoryGirl.create_list(:title, 3)
    @offer = FactoryGirl.create(:offer)
    titles.each do |title|
      @offer.offer_titles.create(title: title, quantity:5) 
    end
  end
  scenario "should delete offer and all offer titles" do
    visit offers_path
    click_link 'Delete', match: :first

    Offer.count.should == 0
    OfferTitle.count.should == 0
  end
end