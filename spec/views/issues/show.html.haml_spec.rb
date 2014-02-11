require 'spec_helper'

describe "issues/show" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :title => "Title",
      :issue_frequency => nil,
      :archive => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
