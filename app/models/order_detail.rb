class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def taxin_price
        price*1.1
  end
  def sum_of_price
    item.taxin_price * amount
  end
end
