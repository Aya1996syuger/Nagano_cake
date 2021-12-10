class Admin::OrderDetailsController < ApplicationController
  def show
   @order_detail = OrderDetails.find(params[:id])
  end
end