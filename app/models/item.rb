class Item < ApplicationRecord
  has_one_attached :photo_item

  validates :genre_id ,presence: true
  validates :name ,presence: true
  validates :introduction ,presence: true
  validates :price ,presence: true
  validates :is_active ,presence: true
  validates :photo_item ,presence: true
end
