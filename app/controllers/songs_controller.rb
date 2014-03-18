class SongsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :favourite, :download, :report]
  load_and_authorize_resource :except => [:rate, :trending, :countdown, :approve, :new, :report, :countdown_songs, :favourite, :favorite, :featured, :download, :most_popular, :older, :downloads, :json_songs, :search, :not_verified]
  def index
    if params[:user_id] and @user = User.find_by_id_or_name(params[:user_id])
      @user = User.find_by_id_or_name(params[:user_id])
        @songs = @user.songs.order("created_at desc").page(params[:page]).per_page(40)
    else
     @songs = Song.page(params[:page]).per_page(40).includes(:user)
     @title = "Latest Songs on Hypejamz"
    end
    respond_to do |format|
      format.html
      format.js
      format.mobile
      format.json {render json: @songs}
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
    @user = @song.user
    @song.played
    impressionist(@song)
    impression = @song.impressionist_count(:filter=>:ip_address)
    @song.countdown(impression)
    @song.delay(queue: "Trend").make_trend(ip = request.env['REMOTE_ADDR'])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.mobile
    end
  end

  def favorite
    @user = User.find_by_id_or_name(params[:id])
    @songs = @user.liked_songs.page(params[:page]).per_page(30)
    respond_to do |format|
      format.html
      format.js
      format.mobile
    end
  end

  def playlist
    @user = User.find_by_id_or_name(params[:id])
    @songs = @user.liked_songs.page(params[:page]).per_page(30)
    respond_to do |format|
      format.html
      format.js
      format.mobile
    end
  end

  def featured

  end

  def trending
    @songs = Song.countdowns.page(params[:page]).per_page(30)
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    @song.user = current_user

    respond_to do |format|
      if @song.save
        current_user.deduct_user_credits(SONG_UPLOAD_CREDIT) unless current_user.admin?
        format.html { redirect_to user_song_path(@song.user, @song), notice: "#{t('song.song_upload_successfully')}" }
        format.json { render json: @song, status: :created, location: @song }
        format.mobile {redirect_to song_path(@song), notice: "#{t('song.song_upload_successfully')}"}
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])
    @song.name = "#{@song.title} by #{@song.user.name}"

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to user_song_path(@song.user, @song), notice: 'Song was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to user_songs_path(@song.user)}
      format.json { head :ok }
    end
  end

  def download
    @song = Song.find(params[:id])
    if @song.price.nil?
      if current_user.account_balance >= SONG_AMOUNT
         current_user.deduct_user_credits(SONG_AMOUNT)
         @song.download
         send_file @song.mp3.path(:original),
                :type => @song.mp3_content_type
         impressionist(@song)
         impression = @song.impressionist_count(:filter=>:ip_address)
         @song.countdown(impression)
         @song.delay(queue: "Download").make_download(ip = request.env['REMOTE_ADDR'], SONG_AMOUNT, current_user.id)
         @song.delay(queue: "Trend").make_trend(ip = request.env['REMOTE_ADDR'])
      else
        respond_to do |format|
          format.html {redirect_to @song, notice: t("song.need_one_credit", :amount => SONG_AMOUNT) }
          format.mobile {redirect_to @song, notice: t("song.need_one_credit", :amount => SONG_AMOUNT)}
        end
      end
    else
        if current_user.account_balance >= @song.price.to_i
          current_user.deduct_user_credits(@song.price.to_i)
          @song.user.award_user_credits(@song.price.to_i)
          @song.download
          send_file @song.mp3.path(:original),
                  :type => @song.mp3_content_type
          impressionist(@song)
          impression = @song.impressionist_count(:filter=>:ip_address)
          @song.countdown(impression)
          @song.delay(queue: "Download").make_download(ip = request.env['REMOTE_ADDR'], @song.price.to_i, current_user)
          @song.delay(queue: "Trend").make_trend(ip = request.env['REMOTE_ADDR'])
        else
          respond_to do |format|
            format.html {redirect_to @song, notice: t("song.need_credit", :amount => @song.price ) }
            format.mobile {redirect_to @song, notice: t("song.need_credit", :amount => @song.price )}
            end
        end
    end
  end

  def most_popular
    @songs = Song.order("play_count desc").page(params[:page]).per_page(30)
  end

  def downloads
   @songs = Song.order("download_count desc").page(params[:page]).per_page(30)
  end

  def older
   @songs = Song.order("created_at asc").page(params[:page]).per_page(30)
  end

  def countdown
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html{redirect_to user_path(@song.user)}
      format.js
    end
  end

  def json_songs
    @songs = Song.order('created_at desc').where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
      format.json { render json: @songs.map(&:name) }
    end
  end

  def search
    @q = params[:q]
    @songs = Song.team(@q).page(params[:page]).per_page(30) # find_by_search_query(@q, current_user)
  end

  def favourite
    @song = Song.find_by_id(params[:id])
    if current_user.likes @song
      current_user.unlike(@song)
      respond_to do |format|
        format.html{redirect_to @song, :alert => t("song.removed_from_playlist", :name => @song.title)}
        format.js
        format.mobile{redirect_to @song, :alert => t("song.removed_from_playlist", :name => @song.title)}
      end
    else
      current_user.like(@song)
      respond_to do |format|
        format.html{redirect_to @song, :notice => t("song.added_to_playlist", :name => @song.title)}
        format.js
        format.mobile{redirect_to @song}
      end
    end
  end

  def approve
    @song = Song.find(params[:id])
    if @song.approved?
      @song.update_attributes(:approved => false)
    else
      @song.update_attributes(:approved => true)
    end
    respond_to do |format|
      format.js
      format.html{redirect_to @song}
    end
  end

  def not_verified
    @songs = Song.not_approved
  end

  def rate
    @song = Song.find(params[:id])
    @song.rate(params[:stars], current_user, params[:dimension])
    average = @song.rate_average(true, params[:dimension])
    width = (average / @song.class.max_stars.to_f) * 100
    render :json => {:id => @song.wrapper_dom_id(params), :average => average, :width => width}
  end

  def report
    @song = Song.find(params[:id])
    if current_user.flagged?(@song, :report)
      current_user.unflag(@song, :report)
      respond_to do |format|
        format.html{redirect_to @song, :notice => t("song.canceled_report", :name => @song.title)}
        format.js
        format.mobile{redirect_to @song, :notice => t("song.removed_report", :name => @song.title)}
      end
    else
       current_user.flag(@song, :report)
      respond_to do |format|
        format.html{redirect_to @song, :alert => t("song.reported", :name => @song.title)}
        format.js
        format.mobile{redirect_to @song, :alert => t("song.reported", :name => @song.title)}
      end
    end
  end


  private

  def create_download(song, hjc)
    song.downloads.create({:ip => request.env['REMOTE_ADDR'], :hjc => hjc, :user_id => current_user.id}, :as => :admin)
  end

  def create_trend(song)
     @trend = song.trends.new({:ip => request.env['REMOTE_ADDR'], :song_id => song.id}, :as => :admin)
     if @trend.valid?
       @trend.save
     else
       logger.debug "Trend has been created"
     end
  end

end
