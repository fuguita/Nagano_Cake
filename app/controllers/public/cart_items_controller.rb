class Public::CartItemsController < ApplicationController

  def create
    if customer_signed_in?
        item = cart_item_params[:item_id]
        amount = cart_item_params[:amount]
        if cart_item = current_customer.cart_items.find_by(item_id: item)
            amount = cart_item.amount + amount.to_i
            cart_item.update(amount: amount)
            redirect_to cart_items_path
        else
            @cart_item = CartItem.new(cart_item_params)
            @cart_item.customer_id = current_customer.id
            if @cart_item.save
                redirect_to cart_items_path
            # else
            #     redirect_to item_path(item)
        end
        end
        # redirect_to cart_items_path
    else
        # flash[:cart_item_notice] = "ログインしてからカート画面にお進みください"
        redirect_to root_path
    end


  end

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
