require 'spec_helper'

describe "songs/new.html.erb" do
  before(:each) do
    assign(:song, stub_model(Song,
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => songs_path, :method => "post" do
      assert_select "input#song_title", :name => "song[title]"
      assert_select "textarea#song_description", :name => "song[description]"
      assert_select "input#song_user", :name => "song[user]"
    end
  end
end
