class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :items, optional: true
  validates :item_id, :order_id, :price_then, :quantity, :making_status, presence: true

  def price_with_tax
    (price_then * 1.1).floor
  end

  def subtotal
    price_with_tax * quantity
  end
end
