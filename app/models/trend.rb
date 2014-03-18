class Trend < ActiveRecord::Base
  belongs_to :song, :counter_cache => true
  validates_uniqueness_of :ip, :scope => :song_id
  validates :ip, :song_id, :presence => true
  attr_accessible :ip, :as => :admin
end
