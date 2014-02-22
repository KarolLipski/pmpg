require "spec_helper"

describe SellPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/sell_points").should route_to("sell_points#index")
    end

    it "routes to #new" do
      get("/sell_points/new").should route_to("sell_points#new")
    end

    it "routes to #show" do
      get("/sell_points/1").should route_to("sell_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sell_points/1/edit").should route_to("sell_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sell_points").should route_to("sell_points#create")
    end

    it "routes to #update" do
      put("/sell_points/1").should route_to("sell_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sell_points/1").should route_to("sell_points#destroy", :id => "1")
    end

  end
end
