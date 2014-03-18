require 'spec_helper'

describe "artists/index.html.erb" do
  before(:each) do
    assign(:artists, [
      stub_model(Artist,
        :user => nil,
        :club => nil
      ),
      stub_model(Artist,
        :user => nil,
        :club => nil
      )
    ])
  end

  it "renders a list of artists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
