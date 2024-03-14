class ApplicationController < ActionController::Base
    helper_method :current_user,:loggedIn?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def loggedIn?
        !!current_user
    end

    def reqiure_user
        if !loggedIn?
            flash[:success] = "You Must LogIn 🥲!!!"
            redirect_to root_path
        end
    end

end
