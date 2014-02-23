require 'spec_helper'

describe SellPointsController do

  let(:valid_attributes) { { "name" => "MyString" } }

  let(:valid_session) { {} }

  let(:address_attributes) { {"0"=>{"company_name"=>"Firma krzak sp.z.oo", 
    "street"=>"Puławska", 
    "street_no"=>"15", 
    "postal_code"=>"05-520", 
    "city"=>"Warszawa", 
    "nip"=>"123-112-77-87", 
    "address_type"=>"invoice"}, 
    "4"=>{"company_name"=>"Krzak.pl", 
    "street"=>"Puławska", 
    "street_no"=>"puławska", 
    "postal_code"=>"05-500", 
    "city"=>"Puławska", 
    "address_type"=>"correspond"}, 
    "8"=>{"company_name"=>"Krzak.pl", 
    "street"=>"Puławska", 
    "street_no"=>"puławska", 
    "postal_code"=>"05-500", 
    "city"=>"Puławska", 
    "address_type"=>"delivery"}}}

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
      get :new
      assigns(:sell_point).should be_a_new(SellPoint)
    end
    it "assigned sell_point should have 3 types of address" do
      get :new
      assigns(:sell_point).addresses.size.should == 3
    end
    it "assigned sell_point should have contact" do
      get :new
      assigns(:sell_point).contacts.size.should == 1
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
      it "should assign sell point" do
        post :create, {:sell_point =>  {name: 'test',
              chained: 'true',
              chain_id: '',:addresses_attributes => address_attributes }
            }
        assigns(:sell_point).should be_a(SellPoint)
      end
      context "when chain is checked and not selected" do
        before(:each) do
          post :create, {:sell_point =>  {name: 'test',
              chained: 'true',
              chain_id: '', :addresses_attributes => address_attributes }
            }
        end
        it "should create new chain" do
          Chain.count.should == 1
        end
        it "should update sell_point chain_id" do
          assigns(:sell_point).chain_id.should == Chain.first.id
        end
      end
      context "when chain is checked and selected" do
        before(:each) do
          @chain = FactoryGirl.create(:chain, name: 'chain1')
          post :create, {:sell_point => { name: 'test',
              chained: 'true',
              chain_id: @chain.id, :addresses_attributes => address_attributes }
          }
        end
        it "should not create new chain" do
          Chain.count.should == 1
        end
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

      context "when chained is set to false" do
        it "chain_id is set to null" do
          @chain = FactoryGirl.create(:chain, name: 'chain1')
          @sell_point = FactoryGirl.create(:sell_point, chain_id: 1)
          put :update, { id: @sell_point.to_param, :sell_point => {
              chained: 'false',
              chain_id: @chain.id }
          }
          assigns(:sell_point).chain_id.should == nil
        end
      end

      it "assigns the requested sell_point as @sell_point" do
        sell_point = SellPoint.create! valid_attributes
        put :update, {:id => sell_point.to_param, :sell_point => valid_attributes}, valid_session
        assigns(:sell_point).should eq(sell_point)
      end

      it "redirects to the sell_points" do
        sell_point = SellPoint.create! valid_attributes
        put :update, {:id => sell_point.to_param, :sell_point => valid_attributes}, valid_session
        response.should redirect_to(sell_points_path)
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
