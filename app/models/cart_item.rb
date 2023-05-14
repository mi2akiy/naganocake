class CartItem < ApplicationRecord
  has_many:items, dependent: :destroy
  has_many:customers, dependent: :destroy
end
