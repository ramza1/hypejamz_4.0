require 'spec_helper'

describe "artist_hypes/edit.html.erb" do
  before(:each) do
    @artist_hype = assign(:artist_hype, stub_model(ArtistHype,
      :neme => "MyString"
    ))
  end

  it "renders the edit artist_hype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artist_hypes_path(@artist_hype), :method => "post" do
      assert_select "input#artist_hype_neme", :name => "artist_hype[neme]"
    end
  end
end
