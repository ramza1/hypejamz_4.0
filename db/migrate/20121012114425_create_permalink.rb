class CreatePermalink < ActiveRecord::Migration
  def change
    Song.find_each do |song|
      song.update_attribute(:permalink, song.title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-'))
    end
    Video.find_each do |video|
      video.update_attribute(:permalink, video.title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-'))
    end
  end
end
