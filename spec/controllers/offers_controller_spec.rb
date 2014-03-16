require 'spec_helper'

describe OffersController do

 
  let(:valid_attributes) { { "name" => "MyString", 
    "description" => "description",
    "price" => "10.23",
    "title_ids" => [] } }


  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all offers as @offers" do
      offer = FactoryGirl.create(:offer)
      get :index, {}
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    it "assigns the requested offer as @offer" do
      offer = Offer.create! valid_attributes
      get :show, {:id => offer.to_param}, valid_session
      assigns(:offer).should eq(offer)
    end
  end

  describe "GET new" do
    it "assigns a new offer as @offer" do
      get :new, {}
      assigns(:offer).should be_a_new(Offer)
    end
  end

  describe "GET edit" do
    it "assigns the requested offer as @offer" do
      offer = FactoryGirl.create(:offer)
      get :edit, {:id => offer.to_param}
      assigns(:offer).should eq(offer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, {:offer => valid_attributes}
        }.to change(Offer, :count).by(1)
      end

      it "assigns a newly created offer as @offer" do
        post :create, {:offer => valid_attributes}
        assigns(:offer).should be_a(Offer)
        assigns(:offer).should be_persisted
      end

      it "redirects to the offer list" do
        post :create, {:offer => valid_attributes}
        response.should redirect_to(offers_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "name" => "invalid value" }}
        assigns(:offer).should be_a_new(Offer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "name" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested offer" do
        offer = FactoryGirl.create(:offer)
        Offer.any_instance.should_receive(:update).with(valid_attributes)
        put :update, {:id => offer.to_param, :offer => valid_attributes}
      end

      it "assigns the requested offer as @offer" do
        offer = FactoryGirl.create(:offer)
        put :update, {:id => offer.to_param, :offer => valid_attributes}, valid_session
        assigns(:offer).should eq(offer)
      end

      it "redirects to the offers path" do
        offer = FactoryGirl.create(:offer)
        put :update, {:id => offer.to_param, :offer => valid_attributes}
        response.should redirect_to(offers_path)
      end
    end

    describe "with invalid params" do
      it "assigns the offer as @offer" do
        offer = FactoryGirl.create(:offer)
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "name" => "invalid value" }}
        assigns(:offer).should eq(offer)
      end

      it "re-renders the 'edit' template" do
        offer = FactoryGirl.create(:offer)
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested offer" do
      offer = FactoryGirl.create(:offer)
      expect {
        delete :destroy, {:id => offer.to_param}
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = FactoryGirl.create(:offer)
      delete :destroy, {:id => offer.to_param}
      response.should redirect_to(offers_url)
    end
  end

end
