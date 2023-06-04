class Public::OrdersController < ApplicationController
  
  before_action :is_matching_login_customer, only: [:show]
  
  def new
    @order = Order.new

  end

  def confirm

    select_payment_method = params[:order][:payment]

    select_address = params[:order][:address_select]
    @order = Order.new(order_params)
    @order.freight = 800
    if select_address == '0'
      @order.postal_code = current_customer.postal_code
      @order.addressee = current_customer.address
      @order.address = current_customer.last_name + current_customer.first_name

    elsif select_address == '1'
      @address = Adress.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.addressee = @address.addressee
      @order.address = @address.address
    elsif select_address == '2'
    end
      @cart_items = CartItem.all
      @total = @cart_items.inject(0){ |sum,item| sum + item.sum_of_price }
    render :confirm
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price*1.08).floor
      @order_detail.save
    end
      
    current_customer.cart_items.destroy_all

    redirect_to public_orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0){ |sum,item| sum + item.sum_of_price }
  end

  private
  
  def is_matching_login_customer
    order = Order.find(params[:id])
    unless order.customer_id == current_customer.id
      redirect_to public_orders_path
    end
  end

  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :addressee, :freight, :amount_claimed)
  end
end
