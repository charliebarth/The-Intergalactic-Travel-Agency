class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :authenticated

    private

    def redirect_to_signup_if_not_logged_in
        redirect_to root_path unless session[:user_id]
    end

    def redirect_already_logged_in
        if authenticated
          flash[:message] = "You are already logged in"
          redirect_to user_path(current_user)
        end
    end

    def redirect_anon_users_to_home
        redirect_to root_path unless authenticated
    end

    def authenticated
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
