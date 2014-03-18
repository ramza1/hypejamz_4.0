require 'spec_helper'

describe "messages/edit.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :subject => "MyString",
      :name => "MyString",
      :email => "MyString",
      :body => "MyText",
      :receiver_id => 1,
      :read => false
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_subject", :name => "message[subject]"
      assert_select "input#message_name", :name => "message[name]"
      assert_select "input#message_email", :name => "message[email]"
      assert_select "textarea#message_body", :name => "message[body]"
      assert_select "input#message_receiver_id", :name => "message[receiver_id]"
      assert_select "input#message_read", :name => "message[read]"
    end
  end
end
