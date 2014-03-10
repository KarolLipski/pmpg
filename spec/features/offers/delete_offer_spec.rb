require 'spec_helper'

feature "delete offer" do
  before(:each) do
    issues = FactoryGirl.create_list(:issue, 3)
    @offer = FactoryGirl.create(:offer)
    issues.each do |issue|
      @offer.issues << issue
    end
  end
  scenario "should delete offer and all offer issues" do
    visit offers_path
    click_link 'Delete', match: :first

    Offer.count.should == 0
    OfferIssue.count.should == 0
  end
end