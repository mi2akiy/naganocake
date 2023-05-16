class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
     @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to  public_customers(current_customer)
  end
  
  def unsbscribe
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

private

def user_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
end

end
