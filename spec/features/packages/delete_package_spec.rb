require 'spec_helper'

feature "delete offer" do
  before(:each) do
    sell_points = FactoryGirl.create_list(:sell_point, 3)
    @package = FactoryGirl.create(:package)
    sell_points.each do |point|
      @package.sell_points << point
    end
  end
  scenario "should delete offer and all offer issues" do
    visit packages_path
    click_link 'Delete', match: :first

    Package.count.should == 0
    SellPointPackage.count.should == 0
  end
end