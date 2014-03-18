require 'spec_helper'

describe "artist_hype_requests/show.html.erb" do
  before(:each) do
    @artist_hype_request = assign(:artist_hype_request, stub_model(ArtistHypeRequest,
      :user_id => "",
      :tellar_no => "Tellar No",
      :bank => "Bank"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tellar No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bank/)
  end
end
