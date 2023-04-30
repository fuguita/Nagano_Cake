class Public::OrdersController < ApplicationController



  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    order.customer_id = current_customer.id
    redirect_to check_order_path(@order)
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method, :shipping_cost, :postal_code, :address, :name, :status)
  end

end
