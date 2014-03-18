class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]
  def index
    if params[:id] and @user =User.find_by_id_or_name(params[:id])
      @user = User.find_by_id_or_name(params[:id])
      @notes = @user.all_notes.page(params[:page]).per_page(30)
      @feed = @user.activities
    else
      @notes = Note.page(params[:page]).per_page(30)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
      format.js
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    @user = @note.user
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :ok }
      format.js
      format.mobile { redirect_to user_profile_path(@note.user) }
    end
  end
end
