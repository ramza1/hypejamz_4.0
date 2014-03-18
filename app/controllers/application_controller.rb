class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper
  protect_from_forgery
  before_filter :check_featured
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  helper_method :yt_client, :completed_video


  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)
  end

  def completed_video
    @videos = Video.incompletes.limit(5)
  end


  def after_sign_in_path_for(resource)
     stored_location_for(resource) || user_profile_path(current_user)
  end

  def check_featured
    return if User.featured_user[:date] == Date.today
    User.featured_user[:date] = Date.today
    User.featured_user[:user] = User.featured
  end

  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
        request.env["HTTP_USER_AGENT"]
        request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  def adjust_format_for_iphone
     request.format = :mobile if ios_user_agent?
  end

  def ios_user_agent?
        request.env["HTTP_USER_AGENT"]
        request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end


end
