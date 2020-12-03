class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
    end

    def redirect_to_signup_if_not_logged_in
        redirect_to root_path unless session[:user_id]
    end
end
