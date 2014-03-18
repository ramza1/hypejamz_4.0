require 'spec_helper'

describe "hype_managers/new.html.erb" do
  before(:each) do
    assign(:hype_manager, stub_model(HypeManager,
      :end_time => "",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new hype_manager form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hype_managers_path, :method => "post" do
      assert_select "input#hype_manager_end_time", :name => "hype_manager[end_time]"
      assert_select "input#hype_manager_name", :name => "hype_manager[name]"
    end
  end
end
