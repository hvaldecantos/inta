require "spec_helper"

describe RolesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/roles").should route_to("roles#index")
    end

    it "routes to #new" do
      get("/admin/roles/new").should route_to("roles#new")
    end

    it "routes to #show" do
      get("/admin/roles/1").should route_to("roles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/roles/1/edit").should route_to("roles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/roles").should route_to("roles#create")
    end

    it "routes to #update" do
      put("/admin/roles/1").should route_to("roles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/roles/1").should route_to("roles#destroy", :id => "1")
    end

  end
end
