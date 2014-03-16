require 'spec_helper'

describe TitlesController do

  describe "GET index" do
    context "when isset publisher id" do
      it "assigns filtered titles to titles" do
        publisher = FactoryGirl.create(:publisher, id: 1)
        publisher.titles << FactoryGirl.create(:title, publisher_id: 1)
        get :index , {:publisher_id => 1}
        assigns(:titles).should == publisher.titles    
      end
    end
    context "when publisher id is not set" do
      it "assigns all titles to @titles" do
        titles = FactoryGirl.create_list(:title,3)
        get :index
        assigns(:titles).count.should == 3
      end
    end
  end

  describe "GET show" do
    it "assigns the requested title as @title" do
      title = FactoryGirl.create(:title)
      get :show, {:id => title.to_param}
      assigns(:title).should eq(title)
    end
  end

  describe "GET new" do
    context "when isset publisher" do
      before(:each) do
        @publisher = FactoryGirl.create(:publisher)
      end
      it "should build new title within publisher" do
        get :new, {publisher_id: @publisher.id }
        assigns(:title).publisher_id.should == @publisher.id
      end
      it "should assigns flag for hidden field to proper redirect after success" do
        get :new, {publisher_id: @publisher.id}
        assigns(:redirect_to_parent).should == true
      end
    end
    context "when publisher is not set" do
      it "assigns a new title as @title" do
        get :new, {}
        assigns(:title).should be_a_new(Title)
      end
    end
  end

  describe "GET edit" do
    context "when isset publisher" do
      it "should assign flag to proper redirect after success" do
        title = FactoryGirl.create(:title)
        get :edit, {publisher_id: title.publisher.id, id: title.to_param}
        assigns(:redirect_to_parent).should == true
      end
    end
    it "assigns the requested title as @title" do
      title = FactoryGirl.create(:title)
      get :edit, {:id => title.to_param}
      assigns(:title).should eq(title)
    end
  end

  describe "POST create" do
    before(:each) do
      @title_frequency = FactoryGirl.create(:title_frequency)
      @publisher = FactoryGirl.create(:publisher)
      @valid_attributes = {'title' => 'title1',
        'archive' => true,
        'title_frequency_id' => @title_frequency.id,
        'publisher_id' => @publisher.id } 
    end
    describe "with valid params" do
      it "creates a new Title" do
        expect {
          post :create, {:title => @valid_attributes }
        }.to change(Title, :count).by(1)
      end

      it "assigns a newly created title as @title" do
        post :create, {:title => @valid_attributes}
        assigns(:title).should be_a(Title)
        assigns(:title).should be_persisted
      end

      it "redirects to publisher titles when redirect_to_parent is present" do
        post :create, {:title => @valid_attributes, :redirect_to_parent => 'true'}
        response.should redirect_to publisher_titles_path(Title.last.publisher)
      end
      it "redirects to the created title" do
        post :create, {:title => @valid_attributes}
        response.should redirect_to titles_path
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved title as @title" do
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        post :create, {:title => @valid_attributes}
        assigns(:title).should be_a_new(Title)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        post :create, {:title => @valid_attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @title = FactoryGirl.create(:title)
      @valid_attributes = {'title' => 'title1',
        'archive' => true } 
    end
    describe "with valid params" do
      it "updates the requested title" do
        Title.any_instance.should_receive(:update).with(@valid_attributes)
        put :update, {:id => @title.to_param, :title =>  @valid_attributes}
      end

      it "assigns the requested title as @title" do
        put :update, {:id => @title.to_param, :title => @valid_attributes}
        assigns(:title).should eq(@title)
      end

      it "redirects to the titles index" do
        put :update, {:id => @title.to_param, :title => @valid_attributes}
        response.should redirect_to(titles_path)
      end

      it 'redirects to publisher titles when redirect_to_parent isset' do
        put :update, {:id => @title.to_param, :title => @valid_attributes,
          :redirect_to_parent => true}
        response.should redirect_to publisher_titles_path(@title.publisher)
      end
    end

    describe "with invalid params" do
      it "assigns the title as @title" do
        Title.any_instance.stub(:save).and_return(false)
        put :update, {:id => @title.to_param, :title => @valid_attributes}
        assigns(:title).should eq(@title)
      end

      it "re-renders the 'edit' template" do
        Title.any_instance.stub(:save).and_return(false)
        put :update, {:id => @title.to_param, :title => @valid_attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @title = FactoryGirl.create(:title)
      request.env["HTTP_REFERER"] = titles_path
    end
    it "destroys the requested title" do
      expect {
        delete :destroy, {:id => @title.to_param}
      }.to change(Title, :count).by(-1)
    end

    it "redirects to the titles list" do
      delete :destroy, {:id => @title.to_param}
      response.should redirect_to(titles_url)
    end
  end

end
