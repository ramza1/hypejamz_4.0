require 'spec_helper'

describe "albums/edit" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :name => "MyString",
      :about => "MyText"
    ))
  end

  it "renders the edit album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path(@album), :method => "post" do
      assert_select "input#album_name", :name => "album[name]"
      assert_select "textarea#album_about", :name => "album[about]"
    end
  end
end
