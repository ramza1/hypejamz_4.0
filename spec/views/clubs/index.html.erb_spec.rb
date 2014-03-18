require 'spec_helper'

describe "clubs/index.html.erb" do
  before(:each) do
    assign(:clubs, [
      stub_model(Club,
        :name => "Name",
        :location => "Location",
        :about => "MyText"
      ),
      stub_model(Club,
        :name => "Name",
        :location => "Location",
        :about => "MyText"
      )
    ])
  end

  it "renders a list of clubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
