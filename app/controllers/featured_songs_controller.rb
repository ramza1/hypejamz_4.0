class FeaturedSongsController < ApplicationController
  load_and_authorize_resource :except => [:mobile_featured]
  def index
    @featured_songs = FeaturedSong.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @featured_songs }
    end
  end

  def mobile_featured
    @featured_songs = FeaturedSong.all

    respond_to do |format|
      format.mobile
    end
  end

  # GET /featured_songs/1
  # GET /featured_songs/1.json
  def show
    @featured_song = FeaturedSong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @featured_song }
    end
  end

  # GET /featured_songs/new
  # GET /featured_songs/new.json
  def new
    @featured_song = FeaturedSong.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @featured_song }
    end
  end

  # GET /featured_songs/1/edit
  def edit
    @featured_song = FeaturedSong.find(params[:id])
  end

  # POST /featured_songs
  # POST /featured_songs.json
  def create
    @featured_song = FeaturedSong.new(params[:featured_song])

    respond_to do |format|
      if @featured_song.save
        format.html { redirect_to @featured_song, notice: 'Featured song was successfully created.' }
        format.json { render json: @featured_song, status: :created, location: @featured_song }
      else
        format.html { render action: "new" }
        format.json { render json: @featured_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /featured_songs/1
  # PUT /featured_songs/1.json
  def update
    @featured_song = FeaturedSong.find(params[:id])

    respond_to do |format|
      if @featured_song.update_attributes(params[:featured_song])
        format.html { redirect_to @featured_song, notice: 'Featured song was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @featured_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_songs/1
  # DELETE /featured_songs/1.json
  def destroy
    @featured_song = FeaturedSong.find(params[:id])
    @featured_song.destroy

    respond_to do |format|
      format.html { redirect_to featured_songs_url }
      format.json { head :ok }
    end
  end
end
