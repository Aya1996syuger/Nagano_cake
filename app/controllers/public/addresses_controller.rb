class Public::AddressesController < ApplicationController
 #配送先登録・一覧
 def index
   @address = Address.new
   @addresses = current_customer.addresses
 end

#配送先編集
 def edit
  @address = Address.find(params[:id])

 end

 def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   @address.save
   redirect_to public_addresses_path
 end

#更新
 def update
   @address = Address.find(params[:id])
  if @address.update(address_params)
   redirect_to public_addresses_path
  else
   @address = address
   render :edit
  end
 end

#配送先削除
 def destroy
  @address = Address.find(params[:id])
  @address.destroy
  redirect_to public_addresses_path
 end

 private
  def address_params
   params.require(:address).permit(:address, :name, :postal_code)
  end
end

