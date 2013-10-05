require "spec_helper"

describe AnalisisRsdsController do
  describe "routing" do

    it "routes to #index" do
      get("/analisis_rsds").should route_to("analisis_rsds#index")
    end

    it "routes to #new" do
      get("/analisis_rsds/new").should route_to("analisis_rsds#new")
    end

    it "routes to #show" do
      get("/analisis_rsds/1").should route_to("analisis_rsds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analisis_rsds/1/edit").should route_to("analisis_rsds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analisis_rsds").should route_to("analisis_rsds#create")
    end

    it "routes to #update" do
      put("/analisis_rsds/1").should route_to("analisis_rsds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analisis_rsds/1").should route_to("analisis_rsds#destroy", :id => "1")
    end

  end
end
