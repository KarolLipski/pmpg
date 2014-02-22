require 'spec_helper'

describe SellPointsController do

  let(:valid_attributes) { { "name" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sell_points as @sell_points" do
      sell_point = FactoryGirl.create(:sell_point)
      get :index, {}
      assigns(:sell_points).should eq([sell_point])
    end
  end

  describe "GET show" do
    it "assigns the requested sell_point as @sell_point" do
      sell_point = SellPoint.create! valid_attributes
      get :show, {:id => sell_point.to_param}, valid_session
      assigns(:sell_point).should eq(sell_point)
    end
  end

  describe "GET new" do
    it "assigns a new sell_point as @sell_point" do
      get :new, {}, valid_session
      assigns(:sell_point).should be_a_new(SellPoint)
    end
  end

  describe "GET edit" do
    it "assigns the requested sell_point as @sell_point" do
      sell_point = SellPoint.create! valid_attributes
      get :edit, {:id => sell_point.to_param}, valid_session
      assigns(:sell_point).should eq(sell_point)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SellPoint" do
        expect {
          post :create, {:sell_point => valid_attributes}, valid_session
        }.to change(SellPoint, :count).by(1)
      end

      it "assigns a newly created sell_point as @sell_point" do
        post :create, {:sell_point => valid_attributes}, valid_session
        assigns(:sell_point).should be_a(SellPoint)
        assigns(:sell_point).should be_persisted
      end

      it "redirects to the created sell_point" do
        post :create, {:sell_point => valid_attributes}, valid_session
        response.should redirect_to(SellPoint.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sell_point as @sell_point" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPoint.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point => { "name" => "invalid value" }}, valid_session
        assigns(:sell_point).should be_a_new(SellPoint)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPoint.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sell_point" do
        sell_point = SellPoint.create! valid_attributes
        SellPoint.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => sell_point.to_param, :sell_point => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested sell_point as @sell_point" do
        sell_point = SellPoint.create! valid_attributes
        put :update, {:id => sell_point.to_param, :sell_point => valid_attributes}, valid_session
        assigns(:sell_point).should eq(sell_point)
      end

      it "redirects to the sell_point" do
        sell_point = SellPoint.create! valid_attributes
        put :update, {:id => sell_point.to_param, :sell_point => valid_attributes}, valid_session
        response.should redirect_to(sell_point)
      end
    end

    describe "with invalid params" do
      it "assigns the sell_point as @sell_point" do
        sell_point = SellPoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SellPoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell_point.to_param, :sell_point => { "name" => "invalid value" }}, valid_session
        assigns(:sell_point).should eq(sell_point)
      end

      it "re-renders the 'edit' template" do
        sell_point = SellPoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SellPoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell_point.to_param, :sell_point => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sell_point" do
      sell_point = SellPoint.create! valid_attributes
      expect {
        delete :destroy, {:id => sell_point.to_param}, valid_session
      }.to change(SellPoint, :count).by(-1)
    end

    it "redirects to the sell_points list" do
      sell_point = SellPoint.create! valid_attributes
      delete :destroy, {:id => sell_point.to_param}, valid_session
      response.should redirect_to(sell_points_url)
    end
  end

end
