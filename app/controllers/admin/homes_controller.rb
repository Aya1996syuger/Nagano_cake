class Admin::HomesController < ApplicationController
  def top
    @order_detail = @customer.order_detail
  end
end
