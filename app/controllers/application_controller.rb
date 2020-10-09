class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_current_user, :authenticate!

    def set_current_user
      @current_user = Moviegoer.find_by(:id => session[:user_id])
    end

    protected
    
    def authenticate!
        unless @current_user
            redirect_to OmniAuth.login_path(:provider)
        end
    end

  end