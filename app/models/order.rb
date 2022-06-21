class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment: {credit_card: 0, transfer: 1}
  enum status: {wait_for_transfer: 1, transfered: 2, processing:3 ,prepare_shipping: 4 ,shipped:5}


  validates :customer_id, :ship_address, :ship_name,
            :status, :postage, :amount, :payment, presence: true
  validates :ship_postal_code , presence: true, length: {is: 7}, numericality: true

  def total_price
    amount + postage
  end

  def display_address
    '〒' + ship_postal_code + " " + ship_address + ' ' + ship_name
  end

  def total_quantity
    i =[]
    order_items.each do |item|
      i << item.quantity
    end
    i.sum
  end
  
end
