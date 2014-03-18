class AdminsController < ApplicationController
  before_filter :check_admin_role
  def index
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

end
