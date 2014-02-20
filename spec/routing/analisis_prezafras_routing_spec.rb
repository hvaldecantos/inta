require "spec_helper"

describe AnalisisPrezafrasController do
  describe "routing" do

    it "routes to #index" do
      get("/analisis_prezafras").should route_to("analisis_prezafras#index")
    end

    it "routes to #new" do
      get("/analisis_prezafras/new").should route_to("analisis_prezafras#new")
    end

    it "routes to #show" do
      get("/analisis_prezafras/1").should route_to("analisis_prezafras#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analisis_prezafras/1/edit").should route_to("analisis_prezafras#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analisis_prezafras").should route_to("analisis_prezafras#create")
    end

    it "routes to #update" do
      put("/analisis_prezafras/1").should route_to("analisis_prezafras#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analisis_prezafras/1").should route_to("analisis_prezafras#destroy", :id => "1")
    end

  end
end
