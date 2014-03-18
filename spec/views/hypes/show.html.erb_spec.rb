require 'spec_helper'

describe "hypes/show.html.erb" do
  before(:each) do
    @hype = assign(:hype, stub_model(Hype,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
