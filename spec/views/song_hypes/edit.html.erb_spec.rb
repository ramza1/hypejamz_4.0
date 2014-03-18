require 'spec_helper'

describe "song_hypes/edit.html.erb" do
  before(:each) do
    @song_hype = assign(:song_hype, stub_model(SongHype,
      :name => "MyString"
    ))
  end

  it "renders the edit song_hype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => song_hypes_path(@song_hype), :method => "post" do
      assert_select "input#song_hype_name", :name => "song_hype[name]"
    end
  end
end
