class Favourite < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :liked_song, :class_name => 'Song'
  validates_uniqueness_of :liked_song_id, :scope => :user_id
  validates_presence_of :user_id, :liked_song_id
  attr_accessible :liked_song_id
end
