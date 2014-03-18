require "spec_helper"

describe ArtistHypesController do
  describe "routing" do

    it "routes to #index" do
      get("/artist_hypes").should route_to("artist_hypes#index")
    end

    it "routes to #new" do
      get("/artist_hypes/new").should route_to("artist_hypes#new")
    end

    it "routes to #show" do
      get("/artist_hypes/1").should route_to("artist_hypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/artist_hypes/1/edit").should route_to("artist_hypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/artist_hypes").should route_to("artist_hypes#create")
    end

    it "routes to #update" do
      put("/artist_hypes/1").should route_to("artist_hypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/artist_hypes/1").should route_to("artist_hypes#destroy", :id => "1")
    end

  end
end
