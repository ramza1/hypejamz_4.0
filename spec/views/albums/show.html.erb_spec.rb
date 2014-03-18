require 'spec_helper'

describe "albums/show" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :name => "Name",
      :about => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
