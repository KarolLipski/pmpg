require 'spec_helper'

describe "sell_points/show" do
  before(:each) do
    @sell_point = assign(:sell_point, stub_model(SellPoint,
      :name => "Name",
      :chain => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
