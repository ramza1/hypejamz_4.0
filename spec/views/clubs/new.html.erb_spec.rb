require 'spec_helper'

describe "clubs/new.html.erb" do
  before(:each) do
    assign(:club, stub_model(Club,
      :name => "MyString",
      :location => "MyString",
      :about => "MyText"
    ).as_new_record)
  end

  it "renders new club form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clubs_path, :method => "post" do
      assert_select "input#club_name", :name => "club[name]"
      assert_select "input#club_location", :name => "club[location]"
      assert_select "textarea#club_about", :name => "club[about]"
    end
  end
end
