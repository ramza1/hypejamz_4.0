class MessagesController < ApplicationController
  # GET /messages
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
  @user = current_user
  if @user.received_messages.empty? && @user.has_network?
     respond_to do |format|
       format.html {redirect_to new_message_path, :notice => "You have no mail in your inbox.  Try sending a message to someone."}
     end
  end

   #if current_user ==  @user
     @messages = @user.received_messages
   #else
    #redirect_to root_url
   #end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = current_user.sent_messages.find(params[:id]) rescue nil
    @message ||= current_user.received_messages.find(params[:id]) rescue nil
    if not @message.nil?
      @message.read = true
      @message.save
    end
  end


  # GET /messages/new
  # GET /messages/new.json
  def new
    if params[:receiver_id] and @user = User.find(params[:receiver_id])
    @user = User.find(params[:receiver_id])
    if current_user == @user
      respond_to do |format|
        format.js
        format.html {redirect_to user_path(@user), :notice => "Sorry you cannot send a message to yourself"}
        format.mobile {redirect_to user_path(@user), :notice => "Sorry you cannot send a message to yourself"}
      end
    else
    @message = Message.new(:receiver_id => @user.id)
    @to_list = current_user.friends.all
    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.mobile
    end
    end
   end
  end

  # GET /messages/1/edit

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.create(params[:message])
    @message.sender = current_user
    respond_to do |format|
      if @message.save
        current_user.deduct_user_credits(5)
        @message.receiver.award_user_credits(4)
        format.html { redirect_to user_path(@message.receiver), notice: "Message sent. 5HJC was deducted from your account" }
        format.js
        format.mobile { redirect_to user_path(@message.receiver), notice: "Message sent. 5HJC was deducted from your account"}
      else
        format.html { render action: "new" }
        format.js
        format.mobile { redirect_to new_message_path(:receiver_id => @message.receiver.id) }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
end
