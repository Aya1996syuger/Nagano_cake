class Admin::HomesController < ApplicationController
  def top
　@orders = Order.all
 #@order_details = @order.order_details



  end
  
  private
   def order_params
    params.require(:order).permit( :customer_id, :postal_code, :shopping_cost, :total_payment, :payment_method, :name, :address )
   end
   
   def order_detail_params
    params.require(:order_detail).permit( :item_id, :order_id, :price, :amount )
   end
end
