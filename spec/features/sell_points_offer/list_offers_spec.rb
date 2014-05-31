require 'spec_helper'

feature "list all offers for selected point" do
  before(:each) do
    offer = FactoryGirl.create(:sell_point_offer)

  end
    scenario "should list offer from points list" do
      visit sell_points_path
      click_link 'Offers'
      page.status_code.should be 200
    end
end