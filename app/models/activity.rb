class Activity < ActiveRecord::Base
  attr_accessible :user, :item
  belongs_to :user
  belongs_to :item, :polymorphic => true
  has_many :feeds, :dependent => :destroy

  def self.global_feed
    find(:all,
         :joins => "INNER JOIN users u ON activities.user_id = u.id",
         :order => 'activities.created_at DESC',
         :limit => 10)
  end
end
