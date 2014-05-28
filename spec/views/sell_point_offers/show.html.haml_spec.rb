require 'spec_helper'

describe "sell_point_offers/show" do
  before(:each) do
    @sell_point_offer = assign(:sell_point_offer, stub_model(SellPointOffer))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
