class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @item = Item.new
    @items = Item.all
  end

  def create
     @item = Item.new(item_params)
  end

  def show
  end

  def edit
  end

  def update
  end
end
