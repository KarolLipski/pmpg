require 'spec_helper'

feature "add new title" do
   context "from titles list" do
      context "with valid data" do
        before(:each) do
          @freq = FactoryGirl.create(:title_frequency)
          @publisher = FactoryGirl.create(:publisher, name: 'Bauer')
          visit titles_path
          click_link 'Create new'
          fill_in 'title_title', with: 'title'
          select 'dziennik', from: 'title_title_frequency_id'
          select 'Bauer', from: 'title_publisher_id'
        end
        scenario "Should add new title" do
          expect {
            click_button 'Save'
          }.to change{Title.count}.by(1)

        end
        scenario "should redirect to titles index page" do
          click_button 'Save'
          current_path.should == titles_path
        end
      end
   end
   context "from publisher list" do
      context " with valid data" do
        before(:each) do
          @freq = FactoryGirl.create(:title_frequency)
          @publisher = FactoryGirl.create(:publisher, name: 'Bauer')
          visit publisher_titles_path(@publisher)
          click_link 'Create new'
          fill_in 'title_title', with: 'title'
          select 'dziennik', from: 'title_title_frequency_id'
          select 'Bauer', from: 'title_publisher_id'
        end
        scenario "should add new title" do
          expect {
            click_button 'Save'
          }.to change{Title.count}.by(1)
        end
        scenario "should redirect to publisher titles" do
          click_button 'Save'
          current_path.should == publisher_titles_path(@publisher)
        end        
      end
   end
end 