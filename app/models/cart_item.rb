class CartItem < ApplicationRecord
  belongs_to :item
  has_many:customers, dependent: :destroy
end
