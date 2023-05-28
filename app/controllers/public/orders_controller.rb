class Public::OrdersController < ApplicationController
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
      @order.address = current_customer.address
      @order.addressee = current_customer.last_name + current_customer.first_name

    elsif select_address == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.addressee = @address.addressee
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
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :addressee, :freight, :amount_claimed)
  end
end
