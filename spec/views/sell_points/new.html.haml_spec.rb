require 'spec_helper'

describe "sell_points/new" do
  before(:each) do
    assign(:sell_point, stub_model(SellPoint,
      :name => "MyString",
      :chain => nil
    ).as_new_record)
  end

  it "renders new sell_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sell_points_path, "post" do
      assert_select "input#sell_point_name[name=?]", "sell_point[name]"
      assert_select "input#sell_point_chain[name=?]", "sell_point[chain]"
    end
  end
end
