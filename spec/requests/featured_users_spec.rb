require 'spec_helper'

describe "FeaturedUsers" do
  describe "GET /featured_users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get featured_users_path
      response.status.should be(200)
    end
  end
end
