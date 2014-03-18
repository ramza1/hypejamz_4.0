class PaymentAddressesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => :verify
  def index
    @payment_addresses = PaymentAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_addresses }
    end
  end

  # GET /payment_addresses/1
  # GET /payment_addresses/1.json
  def show
    @payment_address = PaymentAddress.find(params[:id])
    @user = @payment_address.user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_address }
    end
  end

  # GET /payment_addresses/new
  # GET /payment_addresses/new.json
  def new
    @payment_address = PaymentAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_address }
    end
  end

  # GET /payment_addresses/1/edit
  def edit
    @payment_address = PaymentAddress.find(params[:id])
  end

  # POST /payment_addresses
  # POST /payment_addresses.json
  def create
    @payment_address = PaymentAddress.new(params[:payment_address])
    @payment_address.user = current_user
    respond_to do |format|
      if @payment_address.save
        format.html { redirect_to @payment_address, notice: t("user.payment_address_creation_success") }
        format.json { render json: @payment_address, status: :created, location: @payment_address }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payment_addresses/1
  # PUT /payment_addresses/1.json
  def update
    @payment_address = PaymentAddress.find(params[:id])

    respond_to do |format|
      if @payment_address.update_attributes(params[:payment_address])
        format.html { redirect_to @payment_address, notice: 'Payment address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_addresses/1
  # DELETE /payment_addresses/1.json
  def destroy
    @payment_address = PaymentAddress.find(params[:id])
    @payment_address.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@payment_address.user), notice: t("user.address_deleted") }
      format.json { head :no_content }
    end
  end

  def verify
    @q = params[:q]
    @payment_address = PaymentAddress.find_by_id(params[:address_id])
    if @payment_address.verification_code == @q
       @payment_address.update_attribute(:verified, true)
       flash[:notice] = t("user.account_verified")
       redirect_to @payment_address
    else
       flash[:alert] = t("user.invalid_verification_code")
       redirect_to @payment_address
    end
  end
end
