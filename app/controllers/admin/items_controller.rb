class Admin::ItemsController < ApplicationController
  #アイテム新規作成
  
  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
     @item.save
     redirect_to admin_item_path(@item)
  end

#商品一覧
  def index
    @items = Item.page(params[:page]).per(12)
  end

#商品詳細
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

#商品編集
  def edit
     @item = Item.find(params[:id])
  end

#商品更新
  def update
     @item = Item.find(params[:id])
     if @item.update(item_params)
        redirect_to public_items_path
     else
       @items = Item.all
       render :edit
     end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :genre_id)
  end
end