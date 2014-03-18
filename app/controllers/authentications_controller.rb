class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications if current_user
  end

  # POST /authentications
  # POST /authentications.json
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully"
     sign_in_and_redirect(:user, authentication.user)
    elsif current_user
    current_user.authentications.create!(:provider => omniauth['provider'], :uid => ['uid'])
    flash[:notice] = "Authentication successful"
    redirect_to authentication_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
     if user.save
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, user)
     else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url
     end
    end
  rescue Exception => e
    # Just spit out the error message and a backtrace.
    render :text => "<html><body><pre>" + e.to_s + "</pre><hr /><pre>" + e.backtrace.join("\n") + "</pre></body></html>"

  end


  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to authentications_url }
      format.json { head :ok }
    end
  end
end
