require 'spec_helper'

describe SellPointOffersController do

  let(:valid_attributes) { { offer_id:1,
    start_date: '2012-01-01', end_date: '2012-01-31', price: 12.23  } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns offers for selected point as @offers" do
      offer = FactoryGirl.create(:sell_point_offer)
      get :index, {sell_point_id: offer.sell_point.id }
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    pending 'Nie wiadomo co tam ma byc'
  end

  describe "GET new" do
    it "offer should be build within sell point" do
      offer = FactoryGirl.create(:sell_point_offer)
      get :new, {sell_point_id: offer.sell_point.id}
      assigns(:offer).sell_point.id.should == offer.sell_point.id
    end
  end

  describe "GET edit" do
    it "assigns the requested sell_point_offer as @offer" do
      offer = FactoryGirl.create(:sell_point_offer)
      get :edit, {sell_point_id: offer.sell_point.id,:id => offer.to_param}
      assigns(:offer).should eq(offer)
    end
  end

  describe "POST create" do
    before(:each) do
      FactoryGirl.create(:sell_point, id: 1)
    end
    describe "with valid params" do
      it "creates a new SellPointOffer" do
        expect {
          post :create, {:sell_point_offer => valid_attributes, sell_point_id:1}
        }.to change(SellPointOffer, :count).by(1)
      end

      it "assigns a newly created sell_point_offer as @sell_point_offer" do
        post :create, {:sell_point_offer => valid_attributes, sell_point_id:1}
        assigns(:offer).should be_a(SellPointOffer)
        assigns(:offer).should be_persisted
      end

      it "redirects to the sell points offer list" do
        post :create, {:sell_point_offer => valid_attributes, sell_point_id:1}
        response.should redirect_to sell_point_offers_path(sell_point_id: 1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sell_point_offer as @sell_point_offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point_offer => valid_attributes, sell_point_id:1}
        assigns(:offer).should be_a_new(SellPointOffer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        post :create, {:sell_point_offer => valid_attributes, sell_point_id:1}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
        @sell_point_offer = FactoryGirl.create(:sell_point_offer)
    end
    describe "with valid params" do

      it "assigns the requested sell_point_offer as @sell_point_offer" do
        put :update, {:id => @sell_point_offer.to_param,
          sell_point_id:@sell_point_offer.sell_point_id,
          :sell_point_offer => valid_attributes}
        assigns(:offer).should eq(@sell_point_offer)
      end

      it "redirects to the sell_point_offer list" do
        put :update, {:id => @sell_point_offer.to_param,
          sell_point_id:@sell_point_offer.sell_point_id,
          :sell_point_offer => valid_attributes}
        response.should redirect_to sell_point_offers_path(sell_point_id: 1)
      end
    end

    describe "with invalid params" do
      it "assigns the sell_point_offer as @sell_point_offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        put :update, {:id => @sell_point_offer.to_param,
          sell_point_id:@sell_point_offer.sell_point_id,
          :sell_point_offer => valid_attributes}
        assigns(:offer).should eq(@sell_point_offer)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SellPointOffer.any_instance.stub(:save).and_return(false)
        put :update, {:id => @sell_point_offer.to_param,
          sell_point_id:@sell_point_offer.sell_point_id,
          :sell_point_offer => valid_attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
        @sell_point_offer = FactoryGirl.create(:sell_point_offer)
    end
    it "destroys the requested sell_point_offer" do
      expect {
        delete :destroy, {:id => @sell_point_offer.to_param, 
          sell_point_id:@sell_point_offer.sell_point_id}
      }.to change(SellPointOffer, :count).by(-1)
    end

    it "redirects to the sell_point_offers list" do
      delete :destroy, {:id => @sell_point_offer.to_param,
        sell_point_id:@sell_point_offer.sell_point_id}
      response.should redirect_to sell_point_offers_path(sell_point_id: @sell_point_offer.sell_point.id)
    end
  end

end
