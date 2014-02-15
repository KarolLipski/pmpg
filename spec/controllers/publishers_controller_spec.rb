require 'spec_helper'

describe PublishersController do

  let(:valid_attributes) { { "name" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all publishers as @publishers" do
      publisher = FactoryGirl.create(:publisher)
      get :index
      assigns(:publishers).should eq([publisher])
    end
  end

  describe "GET show" do
    it "assigns the requested publisher as @publisher" do
      publisher = FactoryGirl.create(:publisher)
      get :show, {:id => publisher.to_param}, valid_session
      assigns(:publisher).should eq(publisher)
    end
  end

  describe "GET new" do
    it "assigns a new publisher as @publisher" do
      get :new, {}, valid_session
      assigns(:publisher).should be_a_new(Publisher)
    end
    it "Builded Publisher should have two types of address" do
      get :new, {}, valid_session
      assigns(:publisher).addresses.size.should == 2
    end
    it "builded Publisher shoudl have contact" do
      get :new, {}, valid_session
      assigns(:publisher).contacts.size.should == 1 
    end
  end

  describe "GET edit" do
    it "assigns the requested publisher as @publisher" do
      publisher = Publisher.create! valid_attributes
      get :edit, {:id => publisher.to_param}, valid_session
      assigns(:publisher).should eq(publisher)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Publisher" do
        expect {
          post :create, {:publisher => valid_attributes}, valid_session
        }.to change(Publisher, :count).by(1)
      end

      it "assigns a newly created publisher as @publisher" do
        post :create, {:publisher => valid_attributes}, valid_session
        assigns(:publisher).should be_a(Publisher)
        assigns(:publisher).should be_persisted
      end

      it "redirects to the publisher list" do
        post :create, {:publisher => valid_attributes}, valid_session
        response.should redirect_to(publishers_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved publisher as @publisher" do
        # Trigger the behavior that occurs when invalid params are submitted
        Publisher.any_instance.stub(:save).and_return(false)
        post :create, {:publisher => { "name" => "invalid value" }}, valid_session
        assigns(:publisher).should be_a_new(Publisher)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Publisher.any_instance.stub(:save).and_return(false)
        post :create, {:publisher => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested publisher" do
        publisher = Publisher.create! valid_attributes
        Publisher.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => publisher.to_param, :publisher => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested publisher as @publisher" do
        publisher = Publisher.create! valid_attributes
        put :update, {:id => publisher.to_param, :publisher => valid_attributes}, valid_session
        assigns(:publisher).should eq(publisher)
      end

      it "redirects to the publisher" do
        publisher = Publisher.create! valid_attributes
        put :update, {:id => publisher.to_param, :publisher => valid_attributes}, valid_session
        response.should redirect_to(publishers_path)
      end
    end

    describe "with invalid params" do
      it "assigns the publisher as @publisher" do
        publisher = Publisher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Publisher.any_instance.stub(:save).and_return(false)
        put :update, {:id => publisher.to_param, :publisher => { "name" => "invalid value" }}, valid_session
        assigns(:publisher).should eq(publisher)
      end

      it "re-renders the 'edit' template" do
        publisher = Publisher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Publisher.any_instance.stub(:save).and_return(false)
        put :update, {:id => publisher.to_param, :publisher => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested publisher" do
      publisher = Publisher.create! valid_attributes
      expect {
        delete :destroy, {:id => publisher.to_param}, valid_session
      }.to change(Publisher, :count).by(-1)
    end

    it "redirects to the publishers list" do
      publisher = Publisher.create! valid_attributes
      delete :destroy, {:id => publisher.to_param}, valid_session
      response.should redirect_to(publishers_url)
    end
  end

end
