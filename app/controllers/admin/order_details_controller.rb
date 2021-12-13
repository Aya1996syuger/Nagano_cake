class Admin::OrderDetailsController < ApplicationController
  def show

      @order = Order.all
      @cart_items = @customers.cart_items

  end

  private
   def order_params
    params.require(:order).permit( :customer_id, :postal_code,:address, :name, :payment_method, :shopping_cost, :total_payment)
   end

end