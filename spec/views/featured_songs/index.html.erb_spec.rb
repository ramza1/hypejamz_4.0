require 'spec_helper'

describe "featured_songs/index.html.erb" do
  before(:each) do
    assign(:featured_songs, [
      stub_model(FeaturedSong,
        :song_id => 1,
        :position => 1
      ),
      stub_model(FeaturedSong,
        :song_id => 1,
        :position => 1
      )
    ])
  end

  it "renders a list of featured_songs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
