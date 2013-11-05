require "spec_helper"

describe ProductoresController do
  describe "routing" do

    it "routes to #index" do
      get("/productores").should route_to("productores#index")
    end

    it "routes to #new" do
      get("/productores/new").should route_to("productores#new")
    end

    it "routes to #show" do
      get("/productores/1").should route_to("productores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/productores/1/edit").should route_to("productores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/productores").should route_to("productores#create")
    end

    it "routes to #update" do
      put("/productores/1").should route_to("productores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/productores/1").should route_to("productores#destroy", :id => "1")
    end

  end
end
