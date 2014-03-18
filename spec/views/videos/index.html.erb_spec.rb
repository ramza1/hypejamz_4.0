require 'spec_helper'

describe "videos/index.html.erb" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :title => "Title",
        :description => "Description",
        :yt_video_id => "Yt Video",
        :is_complete => false
      ),
      stub_model(Video,
        :title => "Title",
        :description => "Description",
        :yt_video_id => "Yt Video",
        :is_complete => false
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Yt Video".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
