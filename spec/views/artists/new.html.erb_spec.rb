require 'spec_helper'

describe "artists/new.html.erb" do
  before(:each) do
    assign(:artist, stub_model(Artist,
      :user => nil,
      :club => nil
    ).as_new_record)
  end

  it "renders new artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artists_path, :method => "post" do
      assert_select "input#artist_user", :name => "artist[user]"
      assert_select "input#artist_club", :name => "artist[club]"
    end
  end
end
