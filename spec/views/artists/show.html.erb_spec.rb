require 'spec_helper'

describe "artists/show.html.erb" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist,
      :user => nil,
      :club => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
