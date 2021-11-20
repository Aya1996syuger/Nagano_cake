class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.new
  end

  def create
      @customer = Customer.new(book_params)
  end

  def show
      @customer = Customer.find(params[:id])
  end
  
  def edit
      @customer = Customer.find(params[:id])
  end
end