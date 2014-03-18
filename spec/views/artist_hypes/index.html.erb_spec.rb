require 'spec_helper'

describe "artist_hypes/index.html.erb" do
  before(:each) do
    assign(:artist_hypes, [
      stub_model(ArtistHype,
        :neme => "Neme"
      ),
      stub_model(ArtistHype,
        :neme => "Neme"
      )
    ])
  end

  it "renders a list of artist_hypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Neme".to_s, :count => 2
  end
end
