class Admin::OrderDetailsController < ApplicationController
  def show
      @order_detail = OrderDetail.find(params[:id])
      @order = @order_detail.order
  end

  private
   def order_detail_params
    params.require(:order_detail).permit( :item_id, :order_id, :price, :amount )
   end

end