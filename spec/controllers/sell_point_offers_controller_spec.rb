require 'spec_helper'

describe SellPointOffersController do

  let(:valid_attributes) { {  } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns offers for selected point as @offers" do
      offer = FactoryGirl.create(:sell_point_offer)
      get :index, {sell_point_id: offer.offer.id }
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    it "assigns the requested sell_point_offer as @sell_point_offer" do
      sell_point_offer = SellPointOffer.create! valid_attributes
      get :show, {:id => sell_point_offer.to_param}, valid_session
      assigns(:sell_point_offer).should eq(sell_point_offer)
    end
  end

  describe "GET new" do
    it "assigns a new sell_point_offer as @sell_point_offer" do
      get :new, {}, valid_session
      assigns(:sell_point_offer).should be_a_new(SellPointOffer)
    end
  end

  describe "GET edit" do
    it "assigns the requested sell_point_offer as @sell_point_offer" do
      sell_point_offer = SellPointOffer.create! valid_attributes
      get :edit, {:id => sell_point_offer.to_param}, valid_session
      assigns(:sell_point_offer).should eq(sell_point_offer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SellPointOffer" do
        expect {
          post :create, {:sell_point_offer => valid_attributes}, valid_session
        }.to change(SellPointOffer, :count).by(1)
      end

      it "assigns a newly created sell_point_offer as @sell_point_offer" do
        post :create, {:sell_point_offer => valid_attributes}, valid_session
        assigns(:sell_point_offer).should be_a(SellPointOffer)
        assigns(:sell_point_offer).should be_persisted
      end

      it "redirects to the created sell_point_offer" do
        post :create, {:sell_point_offer => valid_attributes}, valid_session
        response.should redirect_to(SellPointOffer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sell_point_offer as @sell_point_offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point_offer => {  }}, valid_session
        assigns(:sell_point_offer).should be_a_new(SellPointOffer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point_offer => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sell_point_offer" do
        sell_point_offer = SellPointOffer.create! valid_attributes
        # Assuming there are no other sell_point_offers in the database, this
        # specifies that the SellPointOffer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SellPointOffer.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => sell_point_offer.to_param, :sell_point_offer => { "these" => "params" }}, valid_session
      end

      it "assigns the requested sell_point_offer as @sell_point_offer" do
        sell_point_offer = SellPointOffer.create! valid_attributes
        put :update, {:id => sell_point_offer.to_param, :sell_point_offer => valid_attributes}, valid_session
        assigns(:sell_point_offer).should eq(sell_point_offer)
      end

      it "redirects to the sell_point_offer" do
        sell_point_offer = SellPointOffer.create! valid_attributes
        put :update, {:id => sell_point_offer.to_param, :sell_point_offer => valid_attributes}, valid_session
        response.should redirect_to(sell_point_offer)
      end
    end

    describe "with invalid params" do
      it "assigns the sell_point_offer as @sell_point_offer" do
        sell_point_offer = SellPointOffer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell_point_offer.to_param, :sell_point_offer => {  }}, valid_session
        assigns(:sell_point_offer).should eq(sell_point_offer)
      end

      it "re-renders the 'edit' template" do
        sell_point_offer = SellPointOffer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        put :update, {:id => sell_point_offer.to_param, :sell_point_offer => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sell_point_offer" do
      sell_point_offer = SellPointOffer.create! valid_attributes
      expect {
        delete :destroy, {:id => sell_point_offer.to_param}, valid_session
      }.to change(SellPointOffer, :count).by(-1)
    end

    it "redirects to the sell_point_offers list" do
      sell_point_offer = SellPointOffer.create! valid_attributes
      delete :destroy, {:id => sell_point_offer.to_param}, valid_session
      response.should redirect_to(sell_point_offers_url)
    end
  end

end