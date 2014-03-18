require 'spec_helper'

describe "videos/show.html.erb" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :title => "Title",
      :description => "Description",
      :yt_video_id => "Yt Video",
      :is_complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Yt Video/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
