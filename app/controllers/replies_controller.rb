class RepliesController < ApplicationController

  before_filter :authenticate_user!
  def create
    @reply = Reply.new(params[:reply])
    @reply.song_id = params[:song_id]
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        @song = Song.find(params[:song_id])
        format.html { redirect_to @song }
        format.js
        format.mobile {redirect_to @song}
      else
        format.html { redirect_to home_path }
      end
    end
  end

  # PUT /questions/replies/1
  def update
    @reply = Reply.find(params[:id], :include => :song)
    @song = @reply.song

    was_yes = @reply.yes?
    now_yes = params[:reply][:yes].to_i == Reply::Response::Yes

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        # Make sure we keep the question's response cache updated
        if was_yes and not now_yes
          @song.increment(:no_count)
          @song.decrement(:yes_count)
          @song.save
        elsif not was_yes and now_yes
          @song.increment(:yes_count)
          @song.decrement(:no_count)
          @song.save
        end

        format.html { redirect_to @song }
        format.js
        format.mobile { redirect_to @song }
      else
        format.html { redirect_to @song }
      end
    end
  end

end
