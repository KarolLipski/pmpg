require "spec_helper"

describe SellPointOffersController do
  describe "routing" do

    it "routes to #index" do
      get("/sell_point_offers").should route_to("sell_point_offers#index")
    end

    it "routes to #new" do
      get("/sell_point_offers/new").should route_to("sell_point_offers#new")
    end

    it "routes to #show" do
      get("/sell_point_offers/1").should route_to("sell_point_offers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sell_point_offers/1/edit").should route_to("sell_point_offers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sell_point_offers").should route_to("sell_point_offers#create")
    end

    it "routes to #update" do
      put("/sell_point_offers/1").should route_to("sell_point_offers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sell_point_offers/1").should route_to("sell_point_offers#destroy", :id => "1")
    end

  end
end
