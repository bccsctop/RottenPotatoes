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

    require 'themoviedb'
    Tmdb::Api.key("60e2481fc03523c93540e2bdd4b99f47")
  
    def set_config
      @configuration = Tmdb::Configuration.new
    end

  end