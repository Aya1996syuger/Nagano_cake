class Admin::OrdersController < ApplicationController
  def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
  end

  private
   def order_params
    params.require(:order).permit( :item_id, :order_id, :price, :amount )
   end
end
