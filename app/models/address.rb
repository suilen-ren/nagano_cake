class Address < ApplicationRecord
  belongs_to :customer
  validates :customer_id, :name, :address ,presence: true
  validates :postal_code ,length: {is: 7 }, numericality: true
  
  def display_address
    '〒' + postal_code + " " + address + ' ' + name
  end
end
