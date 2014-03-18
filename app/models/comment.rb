class Comment < ActiveRecord::Base
  include ActivityLogger
  belongs_to :user
  attr_accessor :commented_person
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  attr_accessible :comment

  has_many :activities, :foreign_key => "item_id",
                        :conditions => "item_type = 'Comment'",
                        :dependent => :destroy

  validates_presence_of :comment
  after_create :log_activity

    def log_activity
      activity = Activity.create!(:item => self, :user => user)
      add_activities(:activity => activity, :user => user)
      unless commented_person.nil? or user == commented_person
        add_activities(:activity => activity, :user => commented_person,
                       :include_person => true)
      end
    end

  def commented_person
    @commented_person ||= case commentable.class.to_s
                          when "User"
                            commentable
                          when "Note"
                            commentable.user
                          when "Event"
                            commentable.user
                          when "Song"
                            commentable.user
                          end
  end
end
