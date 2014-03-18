require 'spec_helper'

describe "hypes/index.html.erb" do
  before(:each) do
    assign(:hypes, [
      stub_model(Hype,
        :user => nil
      ),
      stub_model(Hype,
        :user => nil
      )
    ])
  end

  it "renders a list of hypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
