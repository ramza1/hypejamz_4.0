class MusicGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
  # attr_accessible :title, :body
end
