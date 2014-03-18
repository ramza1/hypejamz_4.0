require 'spec_helper'

describe "ArtistHypes" do
  describe "GET /artist_hypes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get artist_hypes_path
      response.status.should be(200)
    end
  end
end
