class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
     item = Item.new(item_params)
     item.save
     redirect_to '/top'
  end

  def index
    @item = Item.new
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image_id)
  end
end
