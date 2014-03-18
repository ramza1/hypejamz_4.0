class VideosController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create]
  load_and_authorize_resource :except => [:save_video, :upload, :rate, :search]
  def index
    if params[:user_id] and @user = User.find_by_id_or_name(params[:user_id])
      @user = User.find_by_id_or_name(params[:user_id])
      @videos = @user.videos.order("created_at desc")
    else
    @videos = Video.order("created_at desc")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
      format.js
      format.mobile
    end
  end

  def show
    @video = Video.find(params[:id])
    @user = @video.user
  end

  def search
    @v = params[:v]
    @videos = Video.like(@v).page(params[:page]).per_page(50) # find_by_search_query(@q, current_user)
  end

  def new
    @video = Video.new(:user_id => current_user.id)
  end

  def edit
    @video = Video.find(params[:id])
  end

  # GET /videos/1
  # GET /videos/1.json
   def upload
    @video = Video.create(params[:video])
    if @video
      @upload_info = Video.token_form(params[:video], save_video_new_video_url(:video_id => @video.id))
    else
      respond_to do |format|
        format.html { render "/videos/new" }
        format.mobile {render "videos/new"}
      end
    end
  end

  def update
    @video     = Video.find(params[:id])
    @result    = Video.update_video(@video, params[:video])
    respond_to do |format|
      format.html do
        if @result
          redirect_to @video, :notice => "video successfully updated"
        else
          respond_to do |format|
            format.html { render "/videos/_edit" }
            format.mobile { render "/videos/_edit" }
          end
        end
      end
    end
  end

  def save_video
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
      @video.update_attributes(:yt_video_id => params[:id].to_s, :is_complete => true)
      Video.delete_incomplete_videos
    else
      Video.delete_video(@video)
    end
    redirect_to videos_path, :notice => "video successfully uploaded"
  end

  def destroy
    @video = Video.find(params[:id])
    if Video.delete_video(@video)
      flash[:notice] = "video successfully deleted"
    else
      flash[:error] = "video unsuccessfully deleted"
    end
    redirect_to videos_path
  end

  def rate
    @video = Video.find(params[:id])
    @video.rate(params[:stars], current_user, params[:dimension])
    average = @video.rate_average(true, params[:dimension])
    width = (average / @video.class.max_stars.to_f) * 100
    render :json => {:id => @video.wrapper_dom_id(params), :average => average, :width => width}
  end
end
