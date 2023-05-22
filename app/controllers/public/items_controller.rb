class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem

  end

private
  
  def cart_item_params
     params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
    
end
