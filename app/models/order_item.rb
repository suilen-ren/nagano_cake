class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :items, optional: true
  validates :item_id, :order_id, :price_then, :quantity, :making_status, presence: true
  
  enum making_status: {cannot_make:1,wait_for_making:2,processing:3,completed:4}



  def price_with_tax
    (price_then * 1.1).floor
  end

  def subtotal
    price_with_tax * quantity
  end
end
