class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.new
  end

  def create
      @customer = Customer.new(customer_params)
      @customer.save
      redirect_to admin_customers_path
  end

  def show
      @customer = Customer.find(params[:id])
  end

  def edit
      @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).
    permit(:first_name, :last_name, :last_name_kana,:email, :adress, :telephone_number ,:is_active)
  end
end

