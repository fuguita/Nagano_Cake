class Public::OrdersController < ApplicationController



  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)

    if params[:order][:payment_method] == nil

      render :new
      return
    end


  if params[:order][:address_number] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
    @order.customer_id = current_customer.id
  elsif params[:order][:address_number] == "1"
    @shipping = Shipping.find(params[:order][:shipping_id])
    @order.postal_code = @shipping.postal_code
    @order.address = @shipping.address
    @order.name = @shipping.name
  elsif params[:order][:address_number] == "2"
    if params[:order][:postal_code] || params[:order][:name] ||params[:order][:address]
       render :new
       return
    end
  end

    @cart_items = current_customer.cart_items.all
    @total = 0


  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_item.amount
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to complete_order_path
  end

  def complete

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
