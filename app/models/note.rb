class Note < ActiveRecord::Base
  include ActivityLogger
  has_many :activities, :foreign_key => "item_id", :dependent => :destroy,
                        :conditions => "item_type = 'Note'"

  belongs_to :user, :counter_cache => true
  validates :user, :body, :presence => true
  validates_length_of :body, :maximum => 300
  has_many :comments, :as => :commentable, :order => "created_at asc", :dependent => :destroy
  after_create :notifier_followers
  after_create :log_activity

  def notifier_followers
    followers = (user.friends_of)
    followers.each do |user|
      NoteUpdate.update_followers(user, self).deliver
    end
  end

  private

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end

end
