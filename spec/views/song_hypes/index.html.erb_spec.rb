require 'spec_helper'

describe "song_hypes/index.html.erb" do
  before(:each) do
    assign(:song_hypes, [
      stub_model(SongHype,
        :name => "Name"
      ),
      stub_model(SongHype,
        :name => "Name"
      )
    ])
  end

  it "renders a list of song_hypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
