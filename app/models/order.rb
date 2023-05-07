class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :payment_method, presence: true

  def shipping_cost
    800
  end

  # def total_payment(total)
  #   total + shipping_cost
  # end

  def subtotal
    price * amount
  end





end
