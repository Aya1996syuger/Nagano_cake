class Public::OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def show
  end
end
