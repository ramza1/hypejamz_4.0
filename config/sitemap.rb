# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.hypejamz.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  add songs_path, :priority => 0.7, :changefreq => 'daily'
  add users_path, :priority => 0.7, :changefreq => 'daily'
  add videos_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  Song.find_each do |song|
    add song_path(song), :lastmod => song.updated_at
  end

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end

  Video.find_each do |video|
    add video_path(video), :lastmod => video.updated_at
  end
end