require 'spec_helper'

describe "sell_point_offers/index" do
  before(:each) do
    assign(:sell_point_offers, [
      stub_model(SellPointOffer),
      stub_model(SellPointOffer)
    ])
  end

  it "renders a list of sell_point_offers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
