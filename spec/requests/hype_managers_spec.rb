require 'spec_helper'

describe "HypeManagers" do
  describe "GET /hype_managers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get hype_managers_path
      response.status.should be(200)
    end
  end
end
