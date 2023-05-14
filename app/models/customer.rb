class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many:addresses, dependent: :destroy
  has_many:orders, dependent: :destroy
  belongs_to :cart_item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
