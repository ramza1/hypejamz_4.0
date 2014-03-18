require 'spec_helper'

describe "clubs/show.html.erb" do
  before(:each) do
    @club = assign(:club, stub_model(Club,
      :name => "Name",
      :location => "Location",
      :about => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
