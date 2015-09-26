class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

protected

    def current_user
        @current_user ||= Diner.find(session[:diner_id]) if session[:diner_id]
    end

    helper_method :current_user
end
