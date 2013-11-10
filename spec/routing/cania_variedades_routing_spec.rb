require "spec_helper"

describe CaniaVariedadesController do
  describe "routing" do

    it "routes to #index" do
      get("/cania_variedades").should route_to("cania_variedades#index")
    end

    it "routes to #new" do
      get("/cania_variedades/new").should route_to("cania_variedades#new")
    end

    it "routes to #show" do
      get("/cania_variedades/1").should route_to("cania_variedades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cania_variedades/1/edit").should route_to("cania_variedades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cania_variedades").should route_to("cania_variedades#create")
    end

    it "routes to #update" do
      put("/cania_variedades/1").should route_to("cania_variedades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cania_variedades/1").should route_to("cania_variedades#destroy", :id => "1")
    end

  end
end
