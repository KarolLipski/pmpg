require "spec_helper"

describe SellPointOffersController do
  describe "routing" do

    it "routes to #index" do
      get("/sell_points/1/offers").should route_to("sell_point_offers#index", sell_point_id: "1")
    end

    it "routes to #new" do
      get("/sell_points/1/offers/new").should route_to("sell_point_offers#new",sell_point_id: "1")
    end

    it "routes to #show" do
      get("/sell_points/1/offers/1").should route_to("sell_point_offers#show",sell_point_id: "1", :id => "1")
    end

    it "routes to #edit" do
      get("/sell_points/1/offers/1/edit").should route_to("sell_point_offers#edit",sell_point_id: "1", :id => "1")
    end

    it "routes to #create" do
      post("/sell_points/1/offers").should route_to("sell_point_offers#create",sell_point_id: "1")
    end

    it "routes to #update" do
      put("/sell_points/1/offers/1").should route_to("sell_point_offers#update",sell_point_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sell_points/1/offers/1").should route_to("sell_point_offers#destroy",sell_point_id: "1", :id => "1")
    end

  end
end
