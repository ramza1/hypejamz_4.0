require 'spec_helper'

describe "featured_users/edit.html.erb" do
  before(:each) do
    @featured_user = assign(:featured_user, stub_model(FeaturedUser,
      :user => nil
    ))
  end

  it "renders the edit featured_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => featured_users_path(@featured_user), :method => "post" do
      assert_select "input#featured_user_user", :name => "featured_user[user]"
    end
  end
end
