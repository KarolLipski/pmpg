require 'spec_helper'

feature "list all offers for selected point" do
  before(:each) do
    @offer = FactoryGirl.create(:offer)
    sell_point_offers = FactoryGirl.create_list(:sell_point_offer,2, offer: offer)

  end
    scenario "should list offer" do
      visit sell_point_offer_path(@offer)
      page.should have_selector('table tr', :count => 2)
    end
end