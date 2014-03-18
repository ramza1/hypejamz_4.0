require 'spec_helper'

describe "artist_hype_requests/index.html.erb" do
  before(:each) do
    assign(:artist_hype_requests, [
      stub_model(ArtistHypeRequest,
        :user_id => "",
        :tellar_no => "Tellar No",
        :bank => "Bank"
      ),
      stub_model(ArtistHypeRequest,
        :user_id => "",
        :tellar_no => "Tellar No",
        :bank => "Bank"
      )
    ])
  end

  it "renders a list of artist_hype_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tellar No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bank".to_s, :count => 2
  end
end
