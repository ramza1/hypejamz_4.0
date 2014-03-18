require "spec_helper"

describe HypesController do
  describe "routing" do

    it "routes to #index" do
      get("/hypes").should route_to("hypes#index")
    end

    it "routes to #new" do
      get("/hypes/new").should route_to("hypes#new")
    end

    it "routes to #show" do
      get("/hypes/1").should route_to("hypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hypes/1/edit").should route_to("hypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hypes").should route_to("hypes#create")
    end

    it "routes to #update" do
      put("/hypes/1").should route_to("hypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hypes/1").should route_to("hypes#destroy", :id => "1")
    end

  end
end
