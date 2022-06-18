class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :adresses ,dependent: :destroy
  has_many :cart_items ,dependent: :destroy
  has_many :orders ,dependent: :destroy
  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :email, :encrypted_password, :address, presence: true
  validates :postal_code,presence: true ,length: {is: 7}, numericality: true
  validates :telephone_number, presence: true, numericality: true
  validates :is_active, inclusion: {in:[true,false]}
  def active_for_authentication?
    super && (is_active == true)
  end
  def name
    last_name + first_name
  end
end
