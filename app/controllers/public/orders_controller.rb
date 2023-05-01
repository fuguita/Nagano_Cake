class Public::OrdersController < ApplicationController



  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @total = 0

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
