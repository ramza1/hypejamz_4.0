class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  validates_presence_of :body, :receiver, :sender
  attr_accessible :sender_id, :receiver_id, :body
  after_create :notifier_artist
  attr_immutable :sender_id, :receiver_id, :message
  def unread?
    !read
  end

  def notifier_artist
      Notifier.new_message(receiver, self).deliver
  end

end
