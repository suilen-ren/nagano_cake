class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :item_id, :customer_id, :quantity, presence: true
end
