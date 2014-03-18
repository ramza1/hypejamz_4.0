require 'spec_helper'

describe "song_hypes/show.html.erb" do
  before(:each) do
    @song_hype = assign(:song_hype, stub_model(SongHype,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
