class Address < ApplicationRecord
  belongs_to :customer
  validates :customer_id, :name, :postal_code, :address ,presence: true
end
