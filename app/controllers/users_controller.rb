class UsersController < ApplicationController
    before_action :reqiure_user
    def destroy
        # byebug
        @user = User.find(params[:id])
        if @user.destroy
            session[:user_id] = nil
            flash[:success] = "Account Deleted 🥺!!!"
            redirect_to login_path
        end
    end

end