class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :items
  validates :item_id, :order_id, :price_then, :quantity, :making_status, presence: true
end
