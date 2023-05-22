class CartItem < ApplicationRecord
  belongs_to :item
  has_many:customers, dependent: :destroy
  
  def add_tax_price 
    (self.item.price * 1.10).round
  end
  
end
