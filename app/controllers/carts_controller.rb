class CartsController < ApplicationController
    before_action :reqiure_user
    def destroy
        @cart = Cart.find(params[:id])
        if @cart.destroy
            flash[:success] = "Removed Successfully 🥲!!!"
            redirect_to cart_path(current_user.id)
        end
    end

end