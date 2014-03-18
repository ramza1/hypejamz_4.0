require "spec_helper"

describe FeaturedSongsController do
  describe "routing" do

    it "routes to #index" do
      get("/featured_songs").should route_to("featured_songs#index")
    end

    it "routes to #new" do
      get("/featured_songs/new").should route_to("featured_songs#new")
    end

    it "routes to #show" do
      get("/featured_songs/1").should route_to("featured_songs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/featured_songs/1/edit").should route_to("featured_songs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/featured_songs").should route_to("featured_songs#create")
    end

    it "routes to #update" do
      put("/featured_songs/1").should route_to("featured_songs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/featured_songs/1").should route_to("featured_songs#destroy", :id => "1")
    end

  end
end
