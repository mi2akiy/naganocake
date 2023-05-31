class Order < ApplicationRecord
  belongs_to :customer
  has_many:order_details, dependent: :destroy
  
  enum payment: { credit_card: 1, transfer: 2}
  

end
