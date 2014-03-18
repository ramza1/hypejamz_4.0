require 'spec_helper'

describe "SongHypes" do
  describe "GET /song_hypes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get song_hypes_path
      response.status.should be(200)
    end
  end
end
