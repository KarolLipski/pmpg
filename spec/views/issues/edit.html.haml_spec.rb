require 'spec_helper'

describe "issues/edit" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :title => "MyString",
      :issue_frequency => nil,
      :archive => ""
    ))
  end

  it "renders the edit issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do
      assert_select "input#issue_title[name=?]", "issue[title]"
      assert_select "input#issue_issue_frequency[name=?]", "issue[issue_frequency]"
      assert_select "input#issue_archive[name=?]", "issue[archive]"
    end
  end
end
