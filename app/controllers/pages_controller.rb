class PagesController < ApplicationController
  before_action :reqiure_user,only:[:profile,:edit,:update,:cart,:add_cart]
  before_action :require_same_user,only:[:profile,:edit,:update,:cart]
  def home

  end
  def profile
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    # byebug
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:username,:email,:password,:image))
      flash[:success] = "Your Account Updated Successfully 😎!!!"
      redirect_to profile_path
    else
      flash.now[:danger] = "SomeThink Went Wrong 🥲"
      render 'edit'
    end
  end
  def cart
    @items = current_user.carts
    @total = 0
  end
  def add_cart
    @product = current_user.carts.build(book_id:params[:id])
    if @product.save
      redirect_to cart_path(current_user.id)
    end
  end
  def about

  end

  private

  def require_same_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:danger] = "You Have No Access For It !!!"
      redirect_to books_path
    end
  end

end
