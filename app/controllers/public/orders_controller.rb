class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def creat 
    @order = Order.new(order_params)
    @order.save
      redirect_to public_thanks_path
  end

  def confirm
    
  end

  def thanks
  end

  private
  def order_params
   params.require(:order).permit(:address, :name, :postal_code)
  end
end
