class Public::HomesController < ApplicationController
  def top


    # @items = Item.all.order(created_at: :desc)
    @items = Item.limit(4).order(created_at: :desc)

  end

  def about
  end
end
