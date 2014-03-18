class ActivitiesController < ApplicationController
  def index
    if params[:id] and @user = User.find_by_id_or_name(params[:id])
      @user = User.find_by_id_or_name(params[:id])
      @activities = @user.activities
    else
      @activities = Activity.global_feed
    end
  end
end
