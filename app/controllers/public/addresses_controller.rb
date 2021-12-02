class Public::AddressesController < ApplicationController
 def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
   @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path


  end

  def update
  # address = Address.find(params[:id])
   #if address.update(address_params)
    # redirect_to public_addresses_path
   #else
    # @customer = customer
    # render :edit
   #end
  end

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

