class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def shipping_cost
    800
  end

  def total_payment(total)
    total + shipping_cost
  end

end
