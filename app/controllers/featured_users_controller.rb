class FeaturedUsersController < ApplicationController
  load_and_authorize_resource :except => [:mobile_featured,:featured]
  def index
    @featured_users = FeaturedUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @featured_users }
    end
  end

  def mobile_featured
    @featured_users = FeaturedUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @featured_users }
      format.mobile
    end
  end

  # GET /featured_users/1
  # GET /featured_users/1.json
  def show
    @featured_user = FeaturedUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @featured_user }
    end
  end

   def featured
    @featured_users = FeaturedUser.mobile_users
     respond_to do |format|
      format.html {@stories}
      format.json do
        data={}
        data=  @featured_users.map do|featured|{
          :user_id=>featured.user.id,
          :artist_name=>featured.user.name,
          :artist_url=> user_path(:id=>featured.user.id,format: :json),
          :caption=> featured.user.about,
          :image_url=>(featured.user.icon.present?) ?"#{featured.user.icon.url(:thumb)}":"/assets/icon_small.png",
          :item_collection_path=>"/featured_users/featured.json",  #change to http
          :image_full_url=>featured.image.url(:thumb)
      }
        end
        render json: data.to_json
        end
    end
   end

  # GET /featured_users/new
  # GET /featured_users/new.json
  def new
    @featured_user = FeaturedUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @featured_user }
    end
  end

  # GET /featured_users/1/edit
  def edit
    @featured_user = FeaturedUser.find(params[:id])
  end

  # POST /featured_users
  # POST /featured_users.json
  def create
    @featured_user = FeaturedUser.new(params[:featured_user])

    respond_to do |format|
      if @featured_user.save
        format.html { redirect_to @featured_user, notice: 'Featured user was successfully created.' }
        format.json { render json: @featured_user, status: :created, location: @featured_user }
      else
        format.html { render action: "new" }
        format.json { render json: @featured_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /featured_users/1
  # PUT /featured_users/1.json
  def update
    @featured_user = FeaturedUser.find(params[:id])

    respond_to do |format|
      if @featured_user.update_attributes(params[:featured_user])
        format.html { redirect_to @featured_user, notice: 'Featured user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @featured_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_users/1
  # DELETE /featured_users/1.json
  def destroy
    @featured_user = FeaturedUser.find(params[:id])
    @featured_user.destroy

    respond_to do |format|
      format.html { redirect_to featured_users_url }
      format.json { head :ok }
    end
  end
end
