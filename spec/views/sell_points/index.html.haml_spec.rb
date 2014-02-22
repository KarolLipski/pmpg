require 'spec_helper'

describe "sell_points/index" do
  before(:each) do
    assign(:sell_points, [
      stub_model(SellPoint,
        :name => "Name",
        :chain => nil
      ),
      stub_model(SellPoint,
        :name => "Name",
        :chain => nil
      )
    ])
  end

  it "renders a list of sell_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
