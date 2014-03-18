require 'spec_helper'

describe "hypes/edit.html.erb" do
  before(:each) do
    @hype = assign(:hype, stub_model(Hype,
      :user => nil
    ))
  end

  it "renders the edit hype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hypes_path(@hype), :method => "post" do
      assert_select "input#hype_user", :name => "hype[user]"
    end
  end
end
