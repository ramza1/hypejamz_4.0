class FeaturedSong < ActiveRecord::Base
  belongs_to :song
  validates :song_id, :start, :end, :presence => true
  scope :random_songs, :order => "RAND()", :limit => 8

  def song_name
    song.try(:name)
  end

  def song_name=(name)
    self.song = Song.find_by_name(name) if name.present?
  end
end
