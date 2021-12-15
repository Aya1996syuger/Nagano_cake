class Public::CustomersController < ApplicationController
  #マイページ
  def show
    @customer = Customer.find(params[:id])
  end

#マイページ編集
  def edit
   @customer = Customer.find(params[:id])
  end

#マイページ更新
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

  #退会確認画面
  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  def customer_params
    params.require(:customer).
    permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :address, :telephone_number ,:is_active)
  end
end

