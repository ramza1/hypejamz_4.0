class PicturesController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:user_id] and @user = User.find_by_id_or_name(params[:user_id])
      @user = User.find_by_id_or_name(params[:user_id])
         @pictures = @user.pictures
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])
    @user = @picture.user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
      @picture = Picture.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @picture }
        format.mobile
      end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
    @picture.user = current_user
    respond_to do |format|
      if @picture.save
        format.html {redirect_to user_pictures_path(@picture.user), notice: "picture successfully uploaded."}
        format.mobile {redirect_to user_pictures_path(@picture.user), notice: "picture successfully uploaded."}
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
        format.mobile { render action: "new" }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to user_pictures_path(@picture.user) }
      format.js
    end
  end

end
