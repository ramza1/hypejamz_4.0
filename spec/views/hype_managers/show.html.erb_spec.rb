require 'spec_helper'

describe "hype_managers/show.html.erb" do
  before(:each) do
    @hype_manager = assign(:hype_manager, stub_model(HypeManager,
      :end_time => "",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
