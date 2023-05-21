class Public::AdressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = Adress.all
    @customer = Customer.find(current_customer.id)
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.customer_id = current_customer.id
    @adress.save
    redirect_to public_adresses_path
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def update
    @adress = Adress.find(params[:id])
    @adress.update(adress_params)
    redirect_to public_adresses_path
  end

  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy
    redirect_to public_adresses_path
  end

  private

  def adress_params
    params.require(:adress).permit(:customer_id, :postal_code, :addressee, :address)
  end

end
