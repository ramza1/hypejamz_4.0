class GenresController < ApplicationController
  def show
      @genre = Genre.find(params[:id])
      @songs = @genre.songs.page(params[:page]).per_page(40).includes(:user)
    respond_to do |format|
      format.html
      format.js
      format.mobile
      format.json {render json: @songs}
    end
  end
end
