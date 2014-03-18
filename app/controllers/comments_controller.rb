class CommentsController < ApplicationController
  before_filter :setup
  before_filter :authenticate_user!

  def index
    @comments = @parent.comments
    if params[:user_id]
      @user = @parent
    else
      @user = @parent.user
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @parent.comments.new(:comment => params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html{redirect_to @parent}
        format.js
        format.mobile{redirect_to @parent}
      end
    else
      respond_to do |format|
        format.html{ redirect_to @parent}
        format.js{render 'error.js.erb'}
      end
    end
  end

  def show

  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])

    if @comment.commentable_type == 'User'
      @parent = User.find(@comment.commentable_id)
    end

    if @comment.commentable_type == 'Note'
      @parent = Note.find(@comment.commentable_id)
    end

    if @comment.commentable_type == 'Story'
      @parent = Story.find(@comment.commentable_id)
    end

    if @comment.commentable_type == 'Song'
      @parent = Song.find(@comment.commentable_id)
    end

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @parent }
      format.js
      format.json
      format.mobile {redirect_to @parent}
    end
  end

  def remove
    @comment = Comment.find(params[:id])
    @comment.destroy


    respond_to do |format|
      format.html { redirect_to @parent }
      format.js
      format.mobile {redirect_to @parent}
      format.json
    end
  end

  protected

  def parent; @song || @video || @note || @story || @user || nil end

  def setup
    @song = Song.find(params[:song_id]) unless params[:song_id].blank?
    @video = Video.find(params[:video_id]) unless params[:video_id].blank?
    @note = Note.find(params[:note_id]) unless params[:note_id].blank?
    @story = Story.find(params[:story_id]) unless params[:story_id].blank?
    @user = User.find_by_id_or_name(params[:user_id]) unless params[:user_id].blank?
    @parent = parent
  end
end