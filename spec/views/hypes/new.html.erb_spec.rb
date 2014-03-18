require 'spec_helper'

describe "hypes/new.html.erb" do
  before(:each) do
    assign(:hype, stub_model(Hype,
      :user => nil
    ).as_new_record)
  end

  it "renders new hype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hypes_path, :method => "post" do
      assert_select "input#hype_user", :name => "hype[user]"
    end
  end
end
