require 'spec_helper'

describe "sell_point_offers/new" do
  before(:each) do
    assign(:sell_point_offer, stub_model(SellPointOffer).as_new_record)
  end

  it "renders new sell_point_offer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sell_point_offers_path, "post" do
    end
  end
end
