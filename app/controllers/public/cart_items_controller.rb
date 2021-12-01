 class Public::CartItemsController < ApplicationController
   def index
      @cart_item = CartItem.new
      @cart_items = CartItem.all
   end

   def create
      @cart_item = CartItem.new(cart_items_params)
      current_cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      if current_cart_items.present?
          cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
          cart_item.update!(amount: cart_item.amount + @cart_item.amount)
          redirect_to public_cart_items_path
      else
          @cart_item.customer_id = current_customer.id
          @cart_item.save
          redirect_to public_cart_items_path
      end
   end

   private
    def cart_items_params
        params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end

 end
