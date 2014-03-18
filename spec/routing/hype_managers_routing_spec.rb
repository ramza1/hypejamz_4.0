require "spec_helper"

describe HypeManagersController do
  describe "routing" do

    it "routes to #index" do
      get("/hype_managers").should route_to("hype_managers#index")
    end

    it "routes to #new" do
      get("/hype_managers/new").should route_to("hype_managers#new")
    end

    it "routes to #show" do
      get("/hype_managers/1").should route_to("hype_managers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hype_managers/1/edit").should route_to("hype_managers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hype_managers").should route_to("hype_managers#create")
    end

    it "routes to #update" do
      put("/hype_managers/1").should route_to("hype_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hype_managers/1").should route_to("hype_managers#destroy", :id => "1")
    end

  end
end
