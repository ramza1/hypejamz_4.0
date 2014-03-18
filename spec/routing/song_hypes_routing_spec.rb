require "spec_helper"

describe SongHypesController do
  describe "routing" do

    it "routes to #index" do
      get("/song_hypes").should route_to("song_hypes#index")
    end

    it "routes to #new" do
      get("/song_hypes/new").should route_to("song_hypes#new")
    end

    it "routes to #show" do
      get("/song_hypes/1").should route_to("song_hypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/song_hypes/1/edit").should route_to("song_hypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/song_hypes").should route_to("song_hypes#create")
    end

    it "routes to #update" do
      put("/song_hypes/1").should route_to("song_hypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/song_hypes/1").should route_to("song_hypes#destroy", :id => "1")
    end

  end
end
