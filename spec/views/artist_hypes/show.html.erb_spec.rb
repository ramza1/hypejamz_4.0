require 'spec_helper'

describe "artist_hypes/show.html.erb" do
  before(:each) do
    @artist_hype = assign(:artist_hype, stub_model(ArtistHype,
      :neme => "Neme"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Neme/)
  end
end
