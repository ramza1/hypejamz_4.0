class Picture < ActiveRecord::Base
  include ActivityLogger
  belongs_to :event
  belongs_to :user, :counter_cache => true
  belongs_to :song
  scope :single_pictures, lambda { where(:event_id =>  nil, :song_id => nil)}
  scope :global_pictures, :order => "created_at desc", :limit => 18
  has_attached_file :photo,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_photo_file_name",
                    :styles => {:small => '130x100#', :big => '614x410>', :small_32 => "32x32#"},
                    :url => "/system/:attachment/:id/:style/:normalized_photo_file_name"
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :photo, :less_than => 4.megabyte
  validates_attachment_presence :photo
  after_create :notifier_followers
  attr_accessible :photo, :caption

  has_many :activities, :foreign_key => "item_id",
                        :conditions => "item_type = 'Picture'",
                        :dependent => :destroy

  after_create :log_activity

  Paperclip.interpolates :normalized_photo_file_name do |attachment, style|
    attachment.instance.normalized_photo_file_name
  end

  def normalized_photo_file_name
    "#{self.photo_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end

  def notifier_followers
    followers = (user.friends_of)
    followers.each do |user|
      NoteUpdate.update_user_followers(user, self).deliver
    end
  end

  def log_activity
      activity = Activity.create!(:item => self, :user => user)
      add_activities(:activity => activity, :user => user)
  end
end
