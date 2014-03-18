class Genre < ActiveRecord::Base
  attr_accessible :name
  has_many :music_genres
  has_many :songs, :through =>  :music_genres
end
