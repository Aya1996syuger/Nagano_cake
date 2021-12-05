class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  end

  def thanks
  end

  def create
    @order.save
       redirect_to public_thanks_path
  end
end
