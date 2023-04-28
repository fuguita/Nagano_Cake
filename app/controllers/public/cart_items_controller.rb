class Public::CartItemsController < ApplicationController

  def create
   @item = Item.find(cart_item_params[:item_id])
   @item.save
   redirect_to cart_items_path
    binding.pry

  end

  def index
    @cart_items = current_customer.cart_items

  end

  def destroy_all
    cart_item.dsstroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
