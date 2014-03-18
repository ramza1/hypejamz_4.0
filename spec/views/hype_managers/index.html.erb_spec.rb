require 'spec_helper'

describe "hype_managers/index.html.erb" do
  before(:each) do
    assign(:hype_managers, [
      stub_model(HypeManager,
        :end_time => "",
        :name => "Name"
      ),
      stub_model(HypeManager,
        :end_time => "",
        :name => "Name"
      )
    ])
  end

  it "renders a list of hype_managers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
