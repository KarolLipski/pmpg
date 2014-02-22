require 'spec_helper'

describe "sell_points/edit" do
  before(:each) do
    @sell_point = assign(:sell_point, stub_model(SellPoint,
      :name => "MyString",
      :chain => nil
    ))
  end

  it "renders the edit sell_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sell_point_path(@sell_point), "post" do
      assert_select "input#sell_point_name[name=?]", "sell_point[name]"
      assert_select "input#sell_point_chain[name=?]", "sell_point[chain]"
    end
  end
end
