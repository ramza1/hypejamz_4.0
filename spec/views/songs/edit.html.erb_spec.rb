require 'spec_helper'

describe "songs/edit.html.erb" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => songs_path(@song), :method => "post" do
      assert_select "input#song_title", :name => "song[title]"
      assert_select "textarea#song_description", :name => "song[description]"
      assert_select "input#song_user", :name => "song[user]"
    end
  end
end
