class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :adresses ,dependent: :destroy
  has_many :cart_items ,dependent: :destroy
  has_many :orders ,dependent: :destroy
  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :email, :encrypted_password, :postal_code, :address, :telephone_number,
            presence: true
  validates :is_active, inclusion: {in:[true,false]}
end
