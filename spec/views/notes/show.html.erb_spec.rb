require 'spec_helper'

describe "notes/show.html.erb" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :body => "MyText",
      :user => nil,
      :comments_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
