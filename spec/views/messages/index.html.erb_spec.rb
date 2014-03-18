require 'spec_helper'

describe "messages/index.html.erb" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :subject => "Subject",
        :name => "Name",
        :email => "Email",
        :body => "MyText",
        :receiver_id => 1,
        :read => false
      ),
      stub_model(Message,
        :subject => "Subject",
        :name => "Name",
        :email => "Email",
        :body => "MyText",
        :receiver_id => 1,
        :read => false
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
