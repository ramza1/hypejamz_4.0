require 'spec_helper'

describe "featured_users/show.html.erb" do
  before(:each) do
    @featured_user = assign(:featured_user, stub_model(FeaturedUser,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
