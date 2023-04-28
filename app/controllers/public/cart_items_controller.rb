class Public::CartItemsController < ApplicationController

  def create
    binding.pry
   @item = Item.find(cart_item_params[:item_id])

    # @cart_item = CartItem.new

  end

  def index

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
