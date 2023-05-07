class OrderDetail < ApplicationRecord

  enum making_status: { just_ordered: 0, wait_making: 1, making: 2, made_up: 3 }

  belongs_to :item
  belongs_to :order

  def subtotal
    price * amount
  end


end
