require 'spec_helper'

describe "notes/edit.html.erb" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :body => "MyText",
      :user => nil,
      :comments_count => 1
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path(@note), :method => "post" do
      assert_select "textarea#note_body", :name => "note[body]"
      assert_select "input#note_user", :name => "note[user]"
      assert_select "input#note_comments_count", :name => "note[comments_count]"
    end
  end
end
