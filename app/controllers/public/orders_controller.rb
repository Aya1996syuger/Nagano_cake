class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    
  end

  def creat
  end

  def thanks
  end

  private
  def order_params
   params.require(:order).permit(:customer_id, :postal_code, :shopping_cost, :total_payment, :order_status, :address, :name, :payment_method)
  end

end
