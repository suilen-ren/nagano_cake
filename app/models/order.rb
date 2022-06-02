class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :customer_id, :ship_address_number, :ship_address, :ship_name,
            :status, :postage, :amount, :payment, presence: true
end
