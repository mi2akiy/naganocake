class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genres = Genre.all
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      @item = Item.find(params[:id])
      render :show
    end
  end

  def item_params
  params.require(:item).permit(:item_image, :name, :genre_id, :introduction, :price, :status)
  end
end
