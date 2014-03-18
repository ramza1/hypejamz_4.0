require 'spec_helper'

describe "song_hypes/new.html.erb" do
  before(:each) do
    assign(:song_hype, stub_model(SongHype,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new song_hype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => song_hypes_path, :method => "post" do
      assert_select "input#song_hype_name", :name => "song_hype[name]"
    end
  end
end
