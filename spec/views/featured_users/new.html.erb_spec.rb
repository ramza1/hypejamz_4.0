require 'spec_helper'

describe "featured_users/new.html.erb" do
  before(:each) do
    assign(:featured_user, stub_model(FeaturedUser,
      :user => nil
    ).as_new_record)
  end

  it "renders new featured_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => featured_users_path, :method => "post" do
      assert_select "input#featured_user_user", :name => "featured_user[user]"
    end
  end
end
