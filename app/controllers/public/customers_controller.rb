class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   customer = Customer.find(params[:id])
   if customer.update(customer_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to public_customer_path(customer.id)
   else
     @customer = customer
     render :edit
   end
  end


  def customer_params
    params.require(:customer).
    permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :adress, :telephone_number ,:is_active)
  end
end

