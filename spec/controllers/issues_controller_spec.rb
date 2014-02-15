require 'spec_helper'

describe IssuesController do

  describe "GET index" do
    context "when isset publisher id" do
      it "assigns filtered issues to issues" do
        publisher = FactoryGirl.create(:publisher, id: 1)
        publisher.issues << FactoryGirl.create(:issue, publisher_id: 1)
        get :index , {:publisher_id => 1}
        assigns(:issues).should == publisher.issues    
      end
    end
    context "when publisher id is not set" do
      it "assigns all issues to @issues" do
        issues = FactoryGirl.create_list(:issue,3)
        get :index
        assigns(:issues).count.should == 3
      end
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      issue = FactoryGirl.create(:issue)
      get :show, {:id => issue.to_param}
      assigns(:issue).should eq(issue)
    end
  end

  describe "GET new" do
    context "when isset publisher" do
      before(:each) do
        @publisher = FactoryGirl.create(:publisher)
      end
      it "should build new issue within publisher" do
        get :new, {publisher_id: @publisher.id }
        assigns(:issue).publisher_id.should == @publisher.id
      end
      it "should assigns flag for hidden field to proper redirect after success" do
        get :new, {publisher_id: @publisher.id}
        assigns(:redirect_to_parent).should == true
      end
    end
    context "when publisher is not set" do
      it "assigns a new issue as @issue" do
        get :new, {}
        assigns(:issue).should be_a_new(Issue)
      end
    end
  end

  describe "GET edit" do
    context "when isset publisher" do
      it "should assign flag to proper redirect after success" do
        issue = FactoryGirl.create(:issue)
        get :edit, {publisher_id: issue.publisher.id, id: issue.to_param}
        assigns(:redirect_to_parent).should == true
      end
    end
    it "assigns the requested issue as @issue" do
      issue = FactoryGirl.create(:issue)
      get :edit, {:id => issue.to_param}
      assigns(:issue).should eq(issue)
    end
  end

  describe "POST create" do
    before(:each) do
      @issue_frequency = FactoryGirl.create(:issue_frequency)
      @publisher = FactoryGirl.create(:publisher)
      @valid_attributes = {'title' => 'title1',
        'archive' => true,
        'issue_frequency_id' => @issue_frequency.id,
        'publisher_id' => @publisher.id } 
    end
    describe "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, {:issue => @valid_attributes }
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, {:issue => @valid_attributes}
        assigns(:issue).should be_a(Issue)
        assigns(:issue).should be_persisted
      end

      it "redirects to publisher issues when redirect_to_parent is present" do
        post :create, {:issue => @valid_attributes, :redirect_to_parent => 'true'}
        response.should redirect_to publisher_issues_path(Issue.last.publisher)
      end
      it "redirects to the created issue" do
        post :create, {:issue => @valid_attributes}
        response.should redirect_to issues_path
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => @valid_attributes}
        assigns(:issue).should be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => @valid_attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @issue = FactoryGirl.create(:issue)
      @valid_attributes = {'title' => 'title1',
        'archive' => true } 
    end
    describe "with valid params" do
      it "updates the requested issue" do
        Issue.any_instance.should_receive(:update).with(@valid_attributes)
        put :update, {:id => @issue.to_param, :issue =>  @valid_attributes}
      end

      it "assigns the requested issue as @issue" do
        put :update, {:id => @issue.to_param, :issue => @valid_attributes}
        assigns(:issue).should eq(@issue)
      end

      it "redirects to the issues index" do
        put :update, {:id => @issue.to_param, :issue => @valid_attributes}
        response.should redirect_to(issues_path)
      end

      it 'redirects to publisher issues when redirect_to_parent isset' do
        put :update, {:id => @issue.to_param, :issue => @valid_attributes,
          :redirect_to_parent => true}
        response.should redirect_to publisher_issues_path(@issue.publisher)
      end
    end

    describe "with invalid params" do
      it "assigns the issue as @issue" do
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @issue.to_param, :issue => @valid_attributes}
        assigns(:issue).should eq(@issue)
      end

      it "re-renders the 'edit' template" do
        Issue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @issue.to_param, :issue => @valid_attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @issue = FactoryGirl.create(:issue)
      request.env["HTTP_REFERER"] = issues_path
    end
    it "destroys the requested issue" do
      expect {
        delete :destroy, {:id => @issue.to_param}
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      delete :destroy, {:id => @issue.to_param}
      response.should redirect_to(issues_url)
    end
  end

end
