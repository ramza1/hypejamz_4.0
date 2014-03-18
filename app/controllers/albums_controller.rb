class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:download, :search]
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.page(params[:page]).per_page(30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  def search
    @q = params[:q]
    @albums = Album.like(@q) # find_by_search_query(@q, current_user)
  end
  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
    @user = @album.user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
      format.mobile
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    @album.user = current_user
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  def download
    @album = Album.find(params[:id])
    if @album.for_sale?
      if @album.user == current_user
        @album.download
        send_file @album.file.path(:original),
                  :type => @album.file_content_type
      elsif current_user && current_user.account_balance >= @album.price.to_i
        current_user.deduct_user_credits(@album.price.to_i)
        @album.user.award_user_credits(@album.price.to_i)
        @album.download
        send_file @album.file.path(:original),
                  :type => @album.file_content_type
      else
        respond_to do |format|
          format.html {redirect_to @album, notice: t('no_money_album') }
        end
      end
    else
      @song.download
      send_file @song.mp3.path(:original),
                :type => @song.mp3_content_type
      impressionist(@song)
      impression = @song.impressionist_count(:filter=>:ip_address)
      @song.countdown(impression)
    end
  end
end
