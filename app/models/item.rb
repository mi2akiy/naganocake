class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :cart_item
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image
end
