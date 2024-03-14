class SessionsController < ApplicationController
  before_action :reqiure_user,only:[:destroy]
  before_action :require_loggedIn?,only:[:new,:create_user,:create]
  def new

  end
  def signup

  end
  def create_user
    # byebug
    @user = User.new(params.require(:user).permit(:username,:email,:password,:image))
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your Account was Created Successfully 😁!!! "
      redirect_to books_path
    else
      flash.now[:danger] = "SomeThink Went Wrong 🥲"
      render 'signup'
    end
  end
  def create
    # byebug
    @user = User.find_by(email:params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged In Successfully 🤠!!! "
      redirect_to books_path
    else
      flash[:danger] = "Invalid Credentials 😢!!!"
      render 'new'
    end
  end
  def destroy
    # byebug
    session[:user_id] = nil
    flash[:success] = "You Logged Successfully 🥺!!!"
    redirect_to login_path
  end


  private

  def require_loggedIn?
    if loggedIn?
      flash[:danger] = "You Are Already Logged In 🤠!!!"
      redirect_to books_path
    end
  end
end
