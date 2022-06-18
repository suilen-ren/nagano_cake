class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :item_id, :customer_id, :quantity, presence: true
  
  def subtotal
    item.price_with_tax * quantity
  end
end
