class WelcomeController < ApplicationController
  layout "welcome"
  def index
   @videos = Video.completes_video.limit(4)
   @mobile_songs = Song.approved.limit(7)
   @stories = Story.order("created_at desc").limit(8)
   @users = User.artists.random_hypes
   @latest_songs = Song.order("created_at desc").limit(10)
   @notes = Note.all
   @music_category = Category.find_by_name("Music")
   @entertainment_category = Category.find_by_name("Entertainment")
    respond_to do |format|
      format.html
      format.json {render json: @songs }
      format.js
      format.mobile
    end
  end

  def latest_stories
    @stories = Story.order("created_at desc").limit(4)
  end

  helper_method :latest_stories

end
