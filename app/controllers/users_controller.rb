class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :toggle_subscription]
  before_filter :check_login, :only => [:mobile_subscription]
  skip_before_filter :verify_authenticity_token, :only => [:thank_you, :failed_payment]
  include ApplicationHelper
  def index
   @users = User.order("created_at desc").page(params[:page]).per_page(50)
  end

  def artistes
    @users = User.artists.page(params[:page]).per_page(50)
  end

  def fans
    @user = User.find_by_id_or_name(params[:id])
    @fans = @user.friends_of
  end

  def show
    @user = User.find_by_id_or_name(params[:id])
    @songs = @user.songs.order("created_at desc").limit(2)
    @videos = @user.videos.order("created_at desc").limit(2)
    @pictures = @user.pictures.order("created_at desc").limit(4)
    @users = @user.friends_of
  end

  def edit
    @user ||= User.find_by_id_or_name(params[:id])
    if current_user.can_edit?(@user)
    @user = User.find_by_id_or_name(params[:id])
    else
    render :text => 'Sorry you are not authorized to do that', :layout => true, :status => 401
    end
  end

  def update
    @user = User.find_by_id_or_name(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html {redirect_to @user}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @u = params[:u]
    @users = User.like(@u).page(params[:page]).per_page(50) # find_by_search_query(@q, current_user)
  end

 def json_users
     @users = User.order('created_at desc').where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json {render json: @users.map(&:name)}
      format.mobile
    end
 end

  def toggle_subscription
    @user = User.find_by_id(params[:id])
    if current_user.is_friend? @user
      current_user.remove_friend(@user)
      respond_to do |format|
        format.html{redirect_to @user, alert: t("user.not_a_fan", :name => @user.name.humanize)}
        format.js
        format.mobile{redirect_to @user, alert: t("user.not_a_fan", :name => @user.name.humanize)}
      end
    else
      current_user.add_friend(@user)
      respond_to do |format|
        format.html{redirect_to @user, notice: t("user.a_fan", :name => @user.name.humanize)}
        format.js
        format.mobile{redirect_to @user, notice: t("user.a_fan", :name => @user.name.humanize)}
      end
    end
  end

  def mobile_subscription
    @user = User.find_by_id(params[:id])
    if current_user.is_friend? @user
      current_user.remove_friend(@user)
    else
      current_user.add_friend(@user)
    end
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
      format.mobile{redirect_to @user}
    end
  end

  def thank_you
    redirect_to plans_path
    flash[:notice] = "Your account has been credited"
  end

  def failed_payment
    redirect_to plans_path
    flash[:alert] = "Invalid transaction. Please check your card details, account balance and try again"
  end
  private
  def check_admin_role
    if
      current_user && current_user.admin?
    else
     redirect_to root_url
    flash[:notice] = "You are not allowed to view this page"
    end
  end

  def check_login
    if
     current_user
    else
      respond_to do |format|
        format.mobile {redirect_to new_user_session_path}
      end
    end
  end



end
