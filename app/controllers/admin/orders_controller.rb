class Admin::OrdersController < ApplicationController
  def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
  end

  private
   def order_params
    params.require(:order).permit( :customer_id, :postal_code, :shopping_cost, :total_payment, :payment_method, :name, :address )
   end
end
