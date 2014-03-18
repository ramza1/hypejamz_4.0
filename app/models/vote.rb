class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :counter_cache => true
  belongs_to :rating

  validates_uniqueness_of :user_id, :scope => [:rating_id, :user_id], :message => 'you have already voted.'

end
