require 'spec_helper'

describe "artist_hype_requests/edit.html.erb" do
  before(:each) do
    @artist_hype_request = assign(:artist_hype_request, stub_model(ArtistHypeRequest,
      :user_id => "",
      :tellar_no => "MyString",
      :bank => "MyString"
    ))
  end

  it "renders the edit artist_hype_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artist_hype_requests_path(@artist_hype_request), :method => "post" do
      assert_select "input#artist_hype_request_user_id", :name => "artist_hype_request[user_id]"
      assert_select "input#artist_hype_request_tellar_no", :name => "artist_hype_request[tellar_no]"
      assert_select "input#artist_hype_request_bank", :name => "artist_hype_request[bank]"
    end
  end
end
