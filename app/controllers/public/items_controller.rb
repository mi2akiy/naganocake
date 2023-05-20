class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
  end
end
