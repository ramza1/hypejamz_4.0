require 'spec_helper'

describe "featured_users/index.html.erb" do
  before(:each) do
    assign(:featured_users, [
      stub_model(FeaturedUser,
        :user => nil
      ),
      stub_model(FeaturedUser,
        :user => nil
      )
    ])
  end

  it "renders a list of featured_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
