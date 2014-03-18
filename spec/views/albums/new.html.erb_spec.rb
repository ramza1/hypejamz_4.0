require 'spec_helper'

describe "albums/new" do
  before(:each) do
    assign(:album, stub_model(Album,
      :name => "MyString",
      :about => "MyText"
    ).as_new_record)
  end

  it "renders new album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path, :method => "post" do
      assert_select "input#album_name", :name => "album[name]"
      assert_select "textarea#album_about", :name => "album[about]"
    end
  end
end
