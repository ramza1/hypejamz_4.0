class VerificationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => [:new, :create]
  def index
    @verifications = Verification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verifications }
    end
  end

  # GET /verifications/1
  # GET /verifications/1.json
  def show
    @verification = Verification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verification }
    end
  end

  # GET /verifications/new
  # GET /verifications/new.json
  def new
    @verification = Verification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verification }
    end
  end

  # GET /verifications/1/edit
  def edit
    @verification = Verification.find(params[:id])
  end

  # POST /verifications
  # POST /verifications.json
  def create
    if current_user.verified?
      redirect_to user_path(current_user)
      flash[:notice] = "You are Verified"
    elsif can? :create, Verification
    @verification = current_user.verifications.new(params[:verification])

    respond_to do |format|
      if @verification.save
        current_user.deduct_user_credits(VERIFICATION_CREDIT)
        format.html { redirect_to user_path(current_user), notice: 'Verification in progress.' }
      else
        format.html { render action: "new" }
      end
    end
    else
      redirect_to user_path(current_user)
      flash[:alert] = "Insufficient credit. You need #{VERIFICATION_CREDIT} hjc"
    end
  end

  # PUT /verifications/1
  # PUT /verifications/1.json
  def update
    @verification = Verification.find(params[:id])

    respond_to do |format|
      if @verification.update_attributes(params[:verification])
        format.html { redirect_to @verification, notice: 'Verification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verifications/1
  # DELETE /verifications/1.json
  def destroy
    @verification = Verification.find(params[:id])
    @verification.destroy

    respond_to do |format|
      format.html { redirect_to verifications_url }
      format.json { head :no_content }
    end
  end
end
