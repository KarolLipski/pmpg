require 'spec_helper'

feature "update package" do
  before(:each) do
    sell_points = FactoryGirl.create_list(:sell_point, 3)
    @package = FactoryGirl.create(:package)
    visit edit_package_path(@package)
    fill_in 'package_name', with:'package_name'
    fill_in 'package_description',with: 'description'
    find(:xpath, "//input[@value='#{sell_points[0].id}']").set(true)
    find(:xpath, "//input[@value='#{sell_points[1].id}']").set(true)
  end
  scenario "with valid data" do
    fill_in 'package_price',with: '10.23'
    click_button 'Save'

    Package.count.should == 1
    SellPointPackage.count.should == 2
  end

  scenario "with invalid data" do
    fill_in 'package_price',with: 'aaa'
    click_button 'Save'

    Package.count.should == 1
    SellPointPackage.count.should == 0
  end
end