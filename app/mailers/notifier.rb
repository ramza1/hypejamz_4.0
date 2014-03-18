class Notifier < ActionMailer::Base
  def new_message(receiver, message)
    @receiver = receiver
    @message = message
    mail :to => receiver.email, :subject => "You have a new message on Hypejamz", :from => "feed@hypejamz.com"
  end
end
