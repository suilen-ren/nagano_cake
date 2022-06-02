class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  has_one_attached :photo_item

  validates :genre_id ,presence: true
  validates :name ,presence: true
  validates :introduction ,presence: true
  validates :price ,presence: true
  validates :is_active ,inclusion: {in: [true,false]}
  validates :photo_item ,presence: true
end
