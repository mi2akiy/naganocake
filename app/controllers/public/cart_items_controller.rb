class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_Item.all
  end
end
