require 'spec_helper'


describe PackagesController do

  let(:valid_attributes) { { "name" => "MyString",
    "description" => "description",
    "price" => "10.23",
    "sell_point_ids" => [] } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all packages as @packages" do
      package = FactoryGirl.create(:package)
      get :index, {}, valid_session
      assigns(:packages).should eq([package])
    end
  end

  describe "GET show" do
    it "assigns the requested package as @package" do
      package = FactoryGirl.create(:package)
      get :show, {:id => package.to_param}, valid_session
      assigns(:package).should eq(package)
    end
  end

  describe "GET new" do
    it "assigns a new package as @package" do
      get :new, {}, valid_session
      assigns(:package).should be_a_new(Package)
    end
  end

  describe "GET edit" do
    it "assigns the requested package as @package" do
      package = FactoryGirl.create(:package)
      get :edit, {:id => package.to_param}, valid_session
      assigns(:package).should eq(package)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Package" do
        expect {
          post :create, {:package => valid_attributes}, valid_session
        }.to change(Package, :count).by(1)
      end

      it "assigns a newly created package as @package" do
        post :create, {:package => valid_attributes}, valid_session
        assigns(:package).should be_a(Package)
        assigns(:package).should be_persisted
      end

      it "redirects to the package list" do
        post :create, {:package => valid_attributes}, valid_session
        response.should redirect_to(packages_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved package as @package" do
        # Trigger the behavior that occurs when invalid params are submitted
        Package.any_instance.stub(:save).and_return(false)
        post :create, {:package => { "name" => "invalid value" }}, valid_session
        assigns(:package).should be_a_new(Package)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Package.any_instance.stub(:save).and_return(false)
        post :create, {:package => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested package" do
        package = FactoryGirl.create(:package)
        Package.any_instance.should_receive(:update).with(valid_attributes)
        put :update, {:id => package.to_param, :package => valid_attributes}, valid_session
      end

      it "assigns the requested package as @package" do
        package = FactoryGirl.create(:package)
        put :update, {:id => package.to_param, :package => valid_attributes}, valid_session
        assigns(:package).should eq(package)
      end

      it "redirects to packages_path" do
        package = FactoryGirl.create(:package)
        put :update, {:id => package.to_param, :package => valid_attributes}, valid_session
        response.should redirect_to(packages_path)
      end
    end

    describe "with invalid params" do
      it "assigns the package as @package" do
        package = FactoryGirl.create(:package)
        # Trigger the behavior that occurs when invalid params are submitted
        Package.any_instance.stub(:save).and_return(false)
        put :update, {:id => package.to_param, :package => { "name" => "invalid value" }}, valid_session
        assigns(:package).should eq(package)
      end

      it "re-renders the 'edit' template" do
        package = FactoryGirl.create(:package)
        # Trigger the behavior that occurs when invalid params are submitted
        Package.any_instance.stub(:save).and_return(false)
        put :update, {:id => package.to_param, :package => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested package" do
      package = Package.create! valid_attributes
      expect {
        delete :destroy, {:id => package.to_param}, valid_session
      }.to change(Package, :count).by(-1)
    end

    it "redirects to the packages list" do
      package = Package.create! valid_attributes
      delete :destroy, {:id => package.to_param}, valid_session
      response.should redirect_to(packages_url)
    end
  end

end
