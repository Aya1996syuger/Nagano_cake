class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
     @genre = Genre.new
     @item = Item.new(item_params)
     #@item.genre_id = @genre.id
     @item.save
     redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end
end
