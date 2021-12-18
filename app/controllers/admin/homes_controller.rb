class Admin::HomesController < ApplicationController
  def top
   @orders = Order.all
  @order_details = OrderDetail.all
 

  end
   private
   def order_params
    params.require(:order).permit( :item_id, :order_id, :price, :amount )
   end
end
