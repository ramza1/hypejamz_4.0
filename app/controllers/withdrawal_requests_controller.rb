class WithdrawalRequestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => :withdraw

  def index
    @withdrawal_requests = WithdrawalRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @withdrawal_requests }
    end
  end

  # GET /withdrawal_requests/1
  # GET /withdrawal_requests/1.json
  def show
    @withdrawal_request = WithdrawalRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @withdrawal_request }
    end
  end

  # GET /withdrawal_requests/new
  # GET /withdrawal_requests/new.json
  def new
    @withdrawal_request = WithdrawalRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @withdrawal_request }
    end
  end

  # GET /withdrawal_requests/1/edit
  def edit
    @withdrawal_request = WithdrawalRequest.find(params[:id])
  end

  # POST /withdrawal_requests
  # POST /withdrawal_requests.json
  def create
    @withdrawal_request = WithdrawalRequest.new(params[:withdrawal_request])
    @withdrawal_request.user = current_user
    respond_to do |format|
      if @withdrawal_request.save
        format.html { redirect_to :back, notice: t("request_info") }
        format.js
      else
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  # PUT /withdrawal_requests/1
  # PUT /withdrawal_requests/1.json
  def update
    @withdrawal_request = WithdrawalRequest.find(params[:id])

    respond_to do |format|
      if @withdrawal_request.update_attributes(params[:withdrawal_request])
        format.html { redirect_to @withdrawal_request, notice: 'Withdrawal request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @withdrawal_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawal_requests/1
  # DELETE /withdrawal_requests/1.json
  def destroy
    @withdrawal_request = WithdrawalRequest.find(params[:id])
    @withdrawal_request.destroy

    respond_to do |format|
      format.html { redirect_to withdrawal_requests_url }
      format.json { head :no_content }
    end
  end

  def withdraw
    if current_user.account_balance >= 150
    current_user.withdrawal_requests.create
    flash[:notice] = t("request_info")
    redirect_to :back
    else
      flash[:notice] = 'insufficient Fund to withdraw'
      redirect_to :back
   end
  end
end
