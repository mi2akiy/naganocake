class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0){ |sum,item| sum + item.sum_of_price }
  end
end
