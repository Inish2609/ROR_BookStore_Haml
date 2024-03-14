class PaymentsController < ApplicationController
  def new
    # byebug
    @price = params[:price]
  end
  
  def create
    customer = Stripe::Customer.create({
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })
    
    charge = Stripe::Charge.create({
      :customer => customer.id,
      :amount => params[:price],
      :description => 'Description of your product',
      :currency => 'usd'
    })

    @carts = current_user.carts
    if @carts.destroy_all
      redirect_to cart_path(current_user)
    end
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
  end
end