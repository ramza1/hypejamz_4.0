require "spec_helper"

describe ArtistHypeRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/artist_hype_requests").should route_to("artist_hype_requests#index")
    end

    it "routes to #new" do
      get("/artist_hype_requests/new").should route_to("artist_hype_requests#new")
    end

    it "routes to #show" do
      get("/artist_hype_requests/1").should route_to("artist_hype_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/artist_hype_requests/1/edit").should route_to("artist_hype_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/artist_hype_requests").should route_to("artist_hype_requests#create")
    end

    it "routes to #update" do
      put("/artist_hype_requests/1").should route_to("artist_hype_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/artist_hype_requests/1").should route_to("artist_hype_requests#destroy", :id => "1")
    end

  end
end
