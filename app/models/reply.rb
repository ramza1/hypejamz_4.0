class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates_uniqueness_of :user_id, :scope => [:song_id]
  after_create :update_cache
  after_destroy :remove_song

  class Response
    No = 0
    Yes = 1
  end

  #update the response cache
  def update_cache
    if self.yes?
      Song.increment_counter(:yes_count, song.id)
    else
      Song.increment_counter(:no_count, song.id)
    end
  end

  # When a reply is destroyed
  def remove_song
    if self.yes?
      Song.decrement_counter(:yes_count, song.id)
    else
      Song.decrement_counter(:no_count,  song.id)
    end
  end
end
