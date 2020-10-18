class SessionsController < ApplicationController
    # user shouldn't have to be logged in before logging in!
    skip_before_action :set_current_user
    skip_before_action :authenticate!
    
    def create
      auth=request.env["omniauth.auth"]
      user=Moviegoer.find_by(:provider => auth["provider"], :uid => auth["uid"]) ||
        Moviegoer.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to movies_path
    end
    def destroy
      session.delete(:user_id)
      flash[:notice] = 'Logged out successfully.'
      redirect_to movies_path
    end
    def failure   
        flash[:notice] = 'Could not login'   
        redirect_to root_path
    end
    def loginbefore
        flash[:notice] = 'Please Login'
        redirect_to root_path
    end
end