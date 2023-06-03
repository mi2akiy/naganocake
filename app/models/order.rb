class Order < ApplicationRecord
  belongs_to :customer
  has_many:order_details, dependent: :destroy

  enum payment: { credit_card: 1, transfer: 2}

def get_total_amount(order)
 total = 0
 order.order_details.each do |order_detail|
    total+=order_detail.amount
  end
  return total
end

end
