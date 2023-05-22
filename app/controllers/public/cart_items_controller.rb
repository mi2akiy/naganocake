class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
      @cart_items = CartItem.all
      render 'index'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update
    redirect_to public_cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end
  
  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
