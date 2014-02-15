require 'spec_helper'

feature "add new issue" do
   context "from issues list" do
      context "with valid data" do
        before(:each) do
          @freq = FactoryGirl.create(:issue_frequency)
          @publisher = FactoryGirl.create(:publisher, name: 'Bauer')
          visit issues_path
          click_link 'Create new'
          fill_in 'issue_title', with: 'title'
          select 'dziennik', from: 'issue_issue_frequency_id'
          select 'Bauer', from: 'issue_publisher_id'
        end
        scenario "Should add new issue" do
          expect {
            click_button 'Save'
          }.to change{Issue.count}.by(1)

        end
        scenario "should redirect to issues index page" do
          click_button 'Save'
          current_path.should == issues_path
        end
      end
   end
   context "from publisher list" do
      context " with valid data" do
        before(:each) do
          @freq = FactoryGirl.create(:issue_frequency)
          @publisher = FactoryGirl.create(:publisher, name: 'Bauer')
          visit publisher_issues_path(@publisher)
          click_link 'Create new'
          fill_in 'issue_title', with: 'title'
          select 'dziennik', from: 'issue_issue_frequency_id'
          select 'Bauer', from: 'issue_publisher_id'
        end
        scenario "should add new issue" do
          expect {
            click_button 'Save'
          }.to change{Issue.count}.by(1)
        end
        scenario "should redirect to publisher isssues" do
          click_button 'Save'
          current_path.should == publisher_issues_path(@publisher)
        end        
      end
   end
end 