require "spec_helper"

describe FeaturedUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/featured_users").should route_to("featured_users#index")
    end

    it "routes to #new" do
      get("/featured_users/new").should route_to("featured_users#new")
    end

    it "routes to #show" do
      get("/featured_users/1").should route_to("featured_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/featured_users/1/edit").should route_to("featured_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/featured_users").should route_to("featured_users#create")
    end

    it "routes to #update" do
      put("/featured_users/1").should route_to("featured_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/featured_users/1").should route_to("featured_users#destroy", :id => "1")
    end

  end
end
