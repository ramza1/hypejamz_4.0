require 'spec_helper'

describe "featured_songs/show.html.erb" do
  before(:each) do
    @featured_song = assign(:featured_song, stub_model(FeaturedSong,
      :song_id => 1,
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
