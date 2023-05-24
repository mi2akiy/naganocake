class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order = Order.find(params[:id])
  end
end
