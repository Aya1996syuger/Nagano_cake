class Admin::OrderDetailsController < ApplicationController
  def show
      @order = Order.find(params[:id])
      @cart_items = current_customer.cart_items
  end
end
