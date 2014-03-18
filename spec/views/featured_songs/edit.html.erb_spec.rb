require 'spec_helper'

describe "featured_songs/edit.html.erb" do
  before(:each) do
    @featured_song = assign(:featured_song, stub_model(FeaturedSong,
      :song_id => 1,
      :position => 1
    ))
  end

  it "renders the edit featured_song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => featured_songs_path(@featured_song), :method => "post" do
      assert_select "input#featured_song_song_id", :name => "featured_song[song_id]"
      assert_select "input#featured_song_position", :name => "featured_song[position]"
    end
  end
end
