class Public::CustomersController < ApplicationController


  def show
    @customer = Customer.find_by(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  private

  def customer_params
   params.require(:Customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
