class Public::OrdersController < ApplicationController
  before_action :cart_item_nill, only: [:new]

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
      @cart_items = current_customer.cart_items
      @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @order.address = address.address
      @order.postal_code = address.postal_code
      @order.name = address.name
    elsif params[:order][:select_address] == "2"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end

  end



  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
       @cart_items = CartItem.where(customer_id: current_customer.id)
      if @order.save
        #order_details
        @cart_items.destroy_all
       redirect_to public_order_thanks_path
      else
       render [:new]
      end
  end




  def thanks
  end

  def index
		@orders = current_customer.orders
  end

  def show
	 	@order = Order.find(params[:id])
	 	@cart_items = CartItem.where(customer_id: current_customer.id)
  end

  private

  def order_params
   params.require(:order).permit( :customer_id, :postal_code,:address, :name, :payment_method, :shopping_cost, :total_payment)
  end
  
  def cart_item_nill
    if current_customer.cart_items.empty?
       flash[:error] = "カートが空です。"
        redirect_to public_items_path
    end  
  end
end
