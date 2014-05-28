require 'spec_helper'

describe "sell_point_offers/edit" do
  before(:each) do
    @sell_point_offer = assign(:sell_point_offer, stub_model(SellPointOffer))
  end

  it "renders the edit sell_point_offer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sell_point_offer_path(@sell_point_offer), "post" do
    end
  end
end
